import 'package:dange/functions/get_positions_platform.dart';
import 'package:dange/models/level.dart';
import 'package:dange/models/level_select.dart';

int? checkCorrectVariant(List<Level> levels, List<LevelSelect> steps, List<int> beginPlatform) {
  bool isCorrect = true;
  List<int> currentPlatform = beginPlatform;
  int? errorIndex;
  for (int i = 0; i < steps.length && errorIndex == null; i++) {
    bool canStep = false;

    List<int> positionPlatformNext = getPositionsPlatform(levels[i].platforms, steps[i].platform);

    for (var element in currentPlatform) {
      if (positionPlatformNext.contains(element)) {
        canStep = true;
        currentPlatform = positionPlatformNext;
      }
    }
    if (!canStep) {
      errorIndex = i + 1;
    }
  }
  // print('check variant $errorIndex');

  return errorIndex;
}
