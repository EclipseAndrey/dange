import 'package:dange/functions/get_positions_platform.dart';
import 'package:dange/models/level.dart';
import 'package:dange/models/level_select.dart';
import 'package:dange/models/platform.dart';
import 'package:dange/models/type.dart';
import 'package:dange/models/variant_result.dart';

VariantResult goPath(
    {required int currentBS,
    required List<Level> levels,
    required List<LevelSelect> stepSelect,
    required int currentSizePlatform,
    required List<int> indexCurrentPlatform}) {
  bool test = false;

  int energy = 0;
  int lvlResult = levels[0].index;

  int bs = currentBS;
  int sizePlatform = currentSizePlatform;
  List<int> positionPlatform = indexCurrentPlatform;

  setPositions(List<Platform> ps, int index) {
    sizePlatform = ps[index].size;
    positionPlatform = getPositionsPlatform(ps, index);
  }

  List<String> messages = [];
  bool stepPlatform(Platform p) {
    String message = '';

    switch (p.type) {
      case LevelType.monster:
        {
          message = (bs >= p.dmg ? "Монстр побежден" : "Проиграно монстру => BS $bs");
          if (test) print(message);
          messages.add(message);

          return (bs >= p.dmg);
        }
      case LevelType.increment:
        {
          bs = bs + p.dmg;
          message = ("Боевая сила увеличена на ${p.dmg} => BS $bs");
          if (test) print(message);
          messages.add(message);

          return true;
        }
      case LevelType.upp:
        {
          bs = bs * p.dmg;
          message = ("Боевая сила увеличена в ${p.dmg} раз => BS $bs");
          if (test) print(message);
          messages.add(message);

          return true;
        }
      case LevelType.minus:
        {
          if (bs >= p.dmg) {
            bs -= p.dmg;
            message = ("Боевая сила уменьшена на ${p.dmg} => BS $bs");
            if (test) print(message);
            messages.add(message);

            return true;
          } else {
            message = ("!!!!!! НЕ ХВАТАЕТ БС $lvlResult");
            if (test) print(message);
            messages.add(message);

            return false;
          }
        }
      case LevelType.dec:
        {
          bs = bs ~/ p.dmg;
          message = ("Боевая сила уменьшена в ${p.dmg} раз => BS $bs");
          if (test) print(message);
          messages.add(message);

          return true;
        }
      case LevelType.energy:
        {
          energy = energy + 1;
          message = 'energy';
          messages.add(message);

          return true;
        }
    }
  }

  if (test) print("=============================  variable $stepSelect");

  bool fail = false;
  bool platformFail = false;

  ///========= LEVEL ========
  for (int l = 0; l < stepSelect.length && !fail && !platformFail; l++) {
    if (test) print("\n========= ${levels[l].index} ${levels[l].platforms[stepSelect[l].platform].type} ========== ");
    // if(test)print("platform ${stepSelect[l].platform+1} ${levels[l].platforms[stepSelect[l].platform].type}");

    Level level = levels[l];
    LevelSelect levelSelect = stepSelect[l];
    if (levelSelect.platform >= level.platforms.length) {
      if (test) print("!!!!!! pl len ${levelSelect.platform} >= ${level.platforms.length} lvl $lvlResult");

      platformFail = true;
      continue;
    }

    ///========= PLATFORM ========
    List<int> positionPlatformNext = getPositionsPlatform(level.platforms, levelSelect.platform);

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
  // print(stepSelect);
  final List<LevelSelect> sss = [];
  stepSelect.forEach((element) {
    if (element.level < lvlResult + 1) sss.add(LevelSelect(element.level, element.platform));
  });
  if (!platformFail) print(VariantResult(bs, sss, lvlResult, energy, messages));
  return (VariantResult(bs, sss, lvlResult, energy, messages));
}
