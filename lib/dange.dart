// ignore_for_file: avoid_print

import 'package:dange/functions/check_correct_variable.dart';
import 'package:dange/functions/get_positions_platform.dart';
import 'package:dange/functions/go_path.dart';
import 'package:dange/lvls.dart';
import 'package:dange/models/level.dart';
import 'package:dange/models/level_select.dart';
import 'package:dange/models/platform.dart';
import 'package:dange/models/type.dart';
import 'package:dange/models/variant_result.dart';

List<VariantResult> calculateRoutesV3(int beginBS) {
  /// поделенные уровни
  List<List<Level>> levelsSplit = [];

  /// Split levels
  List<Level> level = [];

  for (int i = 0; i < levels.length; i++) {
    level.add(levels[i]);
    if (levels[i].platforms.length == 1) {
      levelsSplit.add(level);
      level = [];
    }
  }

  bool ready = false;
  List<VariantResult> resultRoutes = [VariantResult(beginBS, [], 0, 0, [])];

  for (int il = 0; il < levelsSplit.length && !ready; il++) {
    int maxCanLevel = 0;
    for (var element in levelsSplit[il]) {
      if (element.index > maxCanLevel) maxCanLevel = element.index;
    }

    List<VariantResult> newResults = [];

    for (int i = 0; i < resultRoutes.length; i++) {
      List<VariantResult> resultRoutesCurrent = calculateRoutesV2(resultRoutes[i].totalBS, levelsSplit[il]);
      newResults.addAll(
        resultRoutesCurrent.map(
          (e) => VariantResult(e.totalBS, [...resultRoutes[i].levelsSelect, ...e.levelsSelect], e.lvl,
              e.energy + resultRoutes[i].energy, [...resultRoutes[i].message, ...e.message]),
        ),
      );
    }

    int maxLevel = 0;
    for (var element in newResults) {
      if (element.lvl > maxLevel) maxLevel = element.lvl;
    }

    if (maxLevel < maxCanLevel) {
      print('не прошло по максималке ${maxLevel}/${maxCanLevel}');
      ready = true;
    }
    newResults.removeWhere((element) => element.lvl != maxLevel);
    if (newResults.length > 20) {
      newResults.sort((a, b) => b.totalBS.compareTo(a.totalBS));
      newResults = newResults.sublist(0, 19);
    }
    resultRoutes = newResults;
  }

  // resultRoutes = calculateRoutesV2(beginBS, levelsSplit.first);
  //
  // int maxLevelFirst = 0;
  // int maxLevelFirstPart = 0;
  // for (var element in resultRoutes) {
  //   if (element.lvl > maxLevelFirst) maxLevelFirst = element.lvl;
  // }
  // for (var element in levelsSplit.first) {
  //   if (element.index > maxLevelFirstPart) maxLevelFirstPart = element.index;
  // }
  //
  // if (maxLevelFirst == maxLevelFirstPart) {}

  return resultRoutes;
}

List<VariantResult> calculateRoutesV2(int power, List<Level> levels) {
  print('STARTED CALCULATE v2');
  int counter = 0;
  bool test = true;

  ///PLATFORM
  int currentSizePlatform = 4;
  List<int> indexCurrentPlatform = [0, 1, 2, 3];

  final List<VariantResult> results = [];

  List<LevelSelect> currentVariable = [];
  for (int i = 0; i < levels.length; i++) {
    currentVariable.add(LevelSelect(levels[i].index, 0));
  }

  bool incrementVariable(int failIndex) {
    // print('Variant result len = $failIndex / ${levels.length}');

    counter++;
    bool ok = false;

    // print('Последний уровень ${levels[failIndex].index}');
    // print('вариант до $currentVariable');

    if (failIndex < levels.length) {
      for (int i = failIndex; i < levels.length; i++) {
        currentVariable[i].platform = 0;
      }
    }

    for (int i = failIndex - 1; i >= 0 && !ok; i--) {
      if (currentVariable[i].platform >= levels[i].platforms.length - 1) {
        currentVariable[i].platform = 0;
      } else {
        currentVariable[i].platform += 1;
        ok = true;
      }
    }
    // print('вариант после  $currentVariable');
    // print('===========');

    if (ok) {
      final fi = checkCorrectVariant(levels, currentVariable, indexCurrentPlatform);
      if (fi != null) {
        incrementVariable(fi);
      }
    }

    return ok;
  }

  // bool incrementVariable() {
  //   counter++;
  //   bool ok = false;
  //   for (int i = currentVariable.length - 1; i >= 0 && !ok; i--) {
  //     if (currentVariable[i].platform >= levels[i].platforms.length - 1) {
  //       currentVariable[i].platform = 0;
  //     } else {
  //       currentVariable[i].platform += 1;
  //       ok = true;
  //     }
  //   }
  //
  //   if (ok && !checkCorrectVariant(levels, currentVariable, indexCurrentPlatform)) {
  //     incrementVariable();
  //   }
  //
  //   return ok;
  // }

  do {
    results.add(
      goPath(
        currentBS: power,
        levels: levels,
        stepSelect: currentVariable,
        currentSizePlatform: currentSizePlatform,
        indexCurrentPlatform: indexCurrentPlatform,
      ),
    );
  } while (incrementVariable(results.last.levelsSelect.length - 1));

  results.sort((a, b) => (a.totalBS > b.totalBS
      ? 1
      : a.totalBS < b.totalBS
          ? -1
          : 0));
  results.sort((a, b) => (a.energy > b.energy
      ? 1
      : a.energy < b.energy
          ? -1
          : 0));
  results.sort((a, b) => (a.lvl > b.lvl
      ? 1
      : a.lvl < b.lvl
          ? -1
          : 0));

  print(results);
  return results;
}

calculateRoutes(int bs) {
  print('STARTED CALCULATE');
  int counter = 0;

  bool test = true;

  ///BS
  int currentBS = bs;

  ///PLATFORM
  int currentSizePlatform = 4;
  List<int> indexCurrentPlatform = [0, 1, 2, 3];

  List<VariantResult> results = [];

  List<LevelSelect> currentVariable = [];
  for (int i = 0; i < levels.length; i++) {
    currentVariable.add(LevelSelect(levels[i].index, 0));
  }

  bool incrementVariable() {
    counter++;
    bool ok = false;
    for (int i = currentVariable.length - 1; i >= 0 && !ok; i--) {
      if (currentVariable[i].platform >= levels[i].platforms.length - 1) {
        currentVariable[i].platform = 0;
      } else {
        currentVariable[i].platform += 1;
        ok = true;
      }
    }

    // if (ok && !checkCorrectVariant(levels, currentVariable, indexCurrentPlatform)) {
    //   incrementVariable();
    // }

    return ok;
  }

  do {
    int energy = 0;
    int lvlResult = levels[0].index;

    int bs = currentBS;
    int sizePlatform = currentSizePlatform;
    List<int> positionPlatform = indexCurrentPlatform;

    setPositions(List<Platform> ps, int index) {
      sizePlatform = ps[index].size;
      positionPlatform = getPositionsPlatform(ps, index);
    }

    bool stepPlatform(Platform p) {
      switch (p.type) {
        case LevelType.monster:
          {
            if (test) print("!!!! monster ${p.dmg} BS $bs");

            return (bs >= p.dmg);
          }
        case LevelType.increment:
          {
            bs = bs + p.dmg;
            if (test) print("+++++ Боевая сила увеличена на ${p.dmg} BS $bs");

            return true;
          }
        case LevelType.upp:
          {
            bs = bs * p.dmg;
            if (test) print("+++++ Боевая сила увеличена в ${p.dmg} раз BS $bs");
            return true;
          }
        case LevelType.minus:
          {
            if (bs >= p.dmg) {
              bs -= p.dmg;
              if (test) print("+++++ Боевая сила уменьшена на ${p.dmg} BS $bs");

              return true;
            } else {
              if (test) print("!!!!!! НЕ ХВАТАЕТ БС $lvlResult");
              return false;
            }
          }
        case LevelType.dec:
          {
            bs = bs ~/ p.dmg;
            if (test) print("+++++ Боевая сила уменьшена в ${p.dmg} раз BS $bs");

            return true;
          }
        case LevelType.energy:
          {
            energy = energy + 1;
            return true;
          }
      }
    }

    if (test) print("====================  variable $counter");

    bool fail = false;

    ///========= LEVEL ========
    for (int l = 0; l < levels.length && !fail; l++) {
      if (test) print("level ${levels[l].index}");
      if (test) print(currentVariable[l]);

      Level level = levels[l];
      LevelSelect levelSelect = currentVariable[l];
      if (levelSelect.platform >= level.platforms.length) {
        if (test) print("!!!!!! pl len ${levelSelect.platform} >= ${level.platforms.length} lvl $lvlResult");

        fail = true;
        continue;
      }

      ///========= PLATFORM ========
      List<int> positionPlatformNext = getPositionsPlatform(level.platforms, levelSelect.platform);
      if (test) print("next $positionPlatformNext ${level.platforms} ${levelSelect.platform}");

      bool canStep = false;
      for (var element in positionPlatform) {
        if (positionPlatformNext.contains(element)) {
          canStep = true;
        }
      }

      bool stepPlatformRes = stepPlatform(level.platforms[levelSelect.platform]);
      if (canStep && stepPlatformRes) {
        fail = false;
      } else {
        if (test) {
          print(
              "!!!!!! нельзя пройти дальше -> canStep=$canStep stepPlatformRes=$stepPlatformRes next $positionPlatformNext curr $positionPlatform $lvlResult");
        }

        fail = true;
      }

      ///========= PLATFORM ========
      setPositions(levels[l].platforms, levelSelect.platform);
      lvlResult = level.index;
    }

    ///========= LEVEL ========
    // if(!fail) {
    // print(currentVariable);

    final List<LevelSelect> sss = [];
    for (var element in currentVariable) {
      if (element.level <= lvlResult) sss.add(LevelSelect(element.level, element.platform));
    }
    if (results.isEmpty || results.last.levelsSelect.toString() != sss.toString()) {
      results.add(VariantResult(bs, sss, lvlResult - 1, energy, []));
    }
    // }
  } while (incrementVariable());

  results.sort((a, b) => (a.totalBS > b.totalBS
      ? 1
      : a.totalBS < b.totalBS
          ? -1
          : 0));
  results.sort((a, b) => (a.energy > b.energy
      ? 1
      : a.energy < b.energy
          ? -1
          : 0));
  results.sort((a, b) => (a.lvl > b.lvl
      ? 1
      : a.lvl < b.lvl
          ? -1
          : 0));

  print(results);
  for (var element in results) {
    goPath(
        indexCurrentPlatform: indexCurrentPlatform,
        stepSelect: element.levelsSelect,
        currentSizePlatform: currentSizePlatform,
        levels: levels,
        currentBS: currentBS);
  }
}
