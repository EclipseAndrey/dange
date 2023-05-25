import 'package:dange/models/platform.dart';

List<int> getPositionsPlatform(List<Platform> ps, int index) {
  List<int> stepPositions = [];
  int sizePlatform = ps[index].size;

  int? startPosition;

  for (int i = 0; i < index; i++) {
    if (startPosition == null) {
      startPosition = ps[i].size;
    } else {
      startPosition += ps[i].size;
    }
  }

  for (int i = startPosition ?? 0; i < sizePlatform + (startPosition ?? 0); i++) {
    stepPositions.add(i);
  }

  return stepPositions;
}
