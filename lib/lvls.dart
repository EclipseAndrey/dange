import 'package:dange/models/level.dart';
import 'package:dange/models/platform.dart';
import 'package:dange/models/type.dart';

/// i LevelType.increment
/// u LevelType.upp
/// m LevelType.minus
/// d LevelType.dec
/// q LevelType.monster
/// e LevelType.energy
///
/// 1
/// 2 k
/// 3 млн
/// 4 млрд
/// 5 трлн
///
///
///
///
/// 1i10001
/// size type dmg exp
///
///
/// Напиши программу на dart которая генерирует код на dart из строки
/// Первая цифра это стартовый index
/// затем следует последовательность строк разделенная пробелами
/// строка состоит из
/// первая цифра это size
/// затем следует LevelType
/// i LevelType.increment
/// u LevelType.upp
/// m LevelType.minus
/// d LevelType.dec
/// q LevelType.monster
/// e LevelType.energy
/// затем следует значение dmg числом с индексом на конце от 1 до 5
/// когда size достигает в сумме 4х то переход к следуюзему лвл
///
///
/// пример входных данных 151  3i80701 1u21 3m532802 1m1006403
/// результат
///
///  Level(151, [
///     Platform(3, LevelType.increment, 8070, 1),
///     Platform(1, LevelType.upp, 2, 1),
///   ]),
///   Level(152, [
///     Platform(3, LevelType.monster, 53280, 2),
///     Platform(1, LevelType.monster, 100640, 3),
///   ]),
///
///
// List<Level> levels = [
//   Level(151, [
//     Platform(3, LevelType.increment, 8070, 1),
//     Platform(1, LevelType.upp, 2, 1),
//   ]),
//   Level(152, [
//     Platform(3, LevelType.monster, 53280, 2),
//     Platform(1, LevelType.monster, 100640, 3),
//   ]),
//   Level(153, [
//     Platform(1, LevelType.increment, 6510),
//     Platform(3, LevelType.minus, 45570),
//   ]),
//   Level(154, [
//     Platform(3, LevelType.monster, 64440),
//     Platform(1, LevelType.increment, 7160),
//   ]),
//   Level(155, [
//     Platform(4, LevelType.monster, 78800),
//   ]),
//   Level(156, [
//     Platform(1, LevelType.monster, 60690),
//     Platform(3, LevelType.increment, 8670),
//   ]),
//   Level(157, [
//     Platform(1, LevelType.energy, 1),
//     Platform(2, LevelType.monster, 47700),
//     Platform(1, LevelType.monster, 57240),
//   ]),
//   Level(158, [
//     Platform(1, LevelType.monster, 73500),
//     Platform(3, LevelType.increment, 15750),
//   ]),
//   Level(159, [
//     Platform(1, LevelType.energy, 1),
//     Platform(2, LevelType.increment, 1),
//     Platform(1, LevelType.monster, 74750),
//   ]),
//   Level(160, [
//     Platform(4, LevelType.monster, 48900),
//   ]),

// Level(116, [
//   Platform(3, LevelType.increment, 98300),
//   Platform(1, LevelType.monster, 1470000),
// ]),
// Level(114, [
//   Platform(3, LevelType.increment, 98300),
//   Platform(1, LevelType.monster, 1470000),
// ]),
// Level(114, [
//   Platform(3, LevelType.increment, 98300),
//   Platform(1, LevelType.monster, 1470000),
// ]),
// Level(114, [
//   Platform(3, LevelType.increment, 98300),
//   Platform(1, LevelType.monster, 1470000),
// ]),
// Level(114, [
//   Platform(3, LevelType.increment, 98300),
//   Platform(1, LevelType.monster, 1470000),
// ]),
// Level(114, [
//   Platform(3, LevelType.increment, 98300),
//   Platform(1, LevelType.monster, 1470000),
// ]),
// ];

List<Level> levels = [
  // Level(20, [
  //   Platform(4, LevelType.monster, 94, 1),
  // ]),
  Level(21, [
    Platform(3, LevelType.monster, 101, 1),
    Platform(1, LevelType.monster, 100, 1),
  ]),
  Level(22, [
    Platform(1, LevelType.increment, 130, 1),
    Platform(3, LevelType.upp, 2, 1),
  ]),
  Level(23, [
    Platform(1, LevelType.monster, 143, 1),
    Platform(2, LevelType.monster, 305, 1),
    Platform(1, LevelType.monster, 224, 1),
  ]),
  Level(24, [
    Platform(1, LevelType.energy, 1, 1),
    Platform(2, LevelType.increment, 45, 1),
    Platform(1, LevelType.monster, 246, 1),
  ]),
  Level(25, [
    Platform(2, LevelType.minus, 197, 1),
    Platform(2, LevelType.dec, 2, 1),
  ]),
  Level(26, [
    Platform(3, LevelType.monster, 162, 1),
    Platform(1, LevelType.increment, 54, 1),
  ]),
  Level(27, [
    Platform(1, LevelType.increment, 179, 1),
    Platform(2, LevelType.monster, 179, 1),
    Platform(1, LevelType.increment, 60, 1),
  ]),
  Level(28, [
    Platform(1, LevelType.energy, 1, 1),
    Platform(3, LevelType.minus, 33, 1),
  ]),
  Level(29, [
    Platform(1, LevelType.monster, 216, 1),
    Platform(2, LevelType.energy, 1, 1),
    Platform(1, LevelType.increment, 36, 1),
  ]),
  Level(30, [
    Platform(4, LevelType.monster, 396, 1),
  ]),
  Level(31, [
    Platform(1, LevelType.energy, 1, 1),
    Platform(2, LevelType.monster, 306, 1),
    Platform(1, LevelType.minus, 153, 1),
  ]),
  Level(32, [
    Platform(3, LevelType.upp, 2, 1),
    Platform(1, LevelType.upp, 3, 1),
  ]),
  Level(33, [
    Platform(1, LevelType.monster, 527, 1),
    Platform(3, LevelType.monster, 738, 1),
  ]),
  Level(34, [
    Platform(1, LevelType.increment, 174, 1),
    Platform(3, LevelType.energy, 1, 1),
  ]),
  Level(35, [
    Platform(3, LevelType.increment, 64, 1),
    Platform(1, LevelType.monster, 957, 1),
  ]),
  Level(36, [
    Platform(2, LevelType.minus, 562, 1),
    Platform(2, LevelType.dec, 2, 1),
  ]),
  Level(37, [
    Platform(2, LevelType.monster, 695, 1),
    Platform(2, LevelType.energy, 1, 1),
  ]),
  Level(38, [
    Platform(1, LevelType.increment, 170, 1),
    Platform(2, LevelType.monster, 850, 1),
    Platform(1, LevelType.monster, 978, 1),
  ]),
  Level(39, [
    Platform(2, LevelType.minus, 141, 1),
    Platform(2, LevelType.increment, 187, 1),
  ]),
  Level(40, [
    Platform(4, LevelType.monster, 1243, 1),
  ]),
  Level(41, [
    Platform(1, LevelType.upp, 2, 1),
    Platform(3, LevelType.increment, 186, 1),
  ]),
  Level(42, [
    Platform(1, LevelType.monster, 2329, 1),
    Platform(3, LevelType.monster, 1233, 1),
  ]),
  Level(43, [
    Platform(3, LevelType.minus, 1057, 1),
    Platform(1, LevelType.increment, 151, 1),
  ]),
  Level(44, [
    Platform(1, LevelType.increment, 166, 1),
    Platform(3, LevelType.monster, 1494, 1),
  ]),
  Level(45, [
    Platform(4, LevelType.monster, 1820, 1),
  ]),
  Level(46, [
    Platform(3, LevelType.increment, 300, 1),
    Platform(1, LevelType.increment, 200, 1),
  ]),
  Level(47, [
    Platform(1, LevelType.minus, 110, 1),
    Platform(2, LevelType.monster, 1980, 1),
    Platform(1, LevelType.monster, 1650, 1),
  ]),
  Level(48, [
    Platform(1, LevelType.energy, 1, 1),
    Platform(2, LevelType.increment, 243, 1),
    Platform(1, LevelType.monster, 1944, 1),
  ]),
  Level(49, [
    Platform(1, LevelType.monster, 2403, 1),
    Platform(3, LevelType.increment, 534, 1),
  ]),
  Level(50, [
    Platform(4, LevelType.monster, 293, 0),
  ]),
  Level(51, [
    Platform(1, LevelType.minus, 1131, 1),
    Platform(2, LevelType.monster, 226, 1),
    Platform(1, LevelType.energy, 1, 1),
  ]),
  Level(52, [
    Platform(1, LevelType.upp, 3, 1),
    Platform(3, LevelType.upp, 2, 1),
  ]),
  Level(53, [
    Platform(3, LevelType.monster, 6474, 1),
    Platform(1, LevelType.monster, 3910, 1),
  ]),
  Level(54, [
    Platform(3, LevelType.energy, 1, 1),
    Platform(1, LevelType.increment, 1290, 1),
  ]),
  Level(55, [
    Platform(1, LevelType.monster, 7095, 1),
    Platform(3, LevelType.increment, 473, 1),
  ]),
  Level(56, [
    Platform(2, LevelType.dec, 2, 1),
    Platform(2, LevelType.minus, 4160, 1),
  ]),
  Level(57, [
    Platform(2, LevelType.energy, 1, 1),
    Platform(2, LevelType.monster, 5145, 1),
  ]),
  Level(58, [
    Platform(1, LevelType.monster, 7243, 1),
    Platform(2, LevelType.monster, 6290, 1),
    Platform(1, LevelType.increment, 1258, 1),
  ]),
  Level(59, [
    Platform(2, LevelType.increment, 1384, 1),
    Platform(2, LevelType.minus, 1038, 1),
  ]),
  Level(60, [
    Platform(4, LevelType.monster, 7610, 1),
  ]),
  Level(61, [
    Platform(2, LevelType.increment, 2511, 1),
    Platform(2, LevelType.monster, 5859, 1),
  ]),
  Level(62, [
    Platform(1, LevelType.monster, 7368, 1),
    Platform(3, LevelType.minus, 921, 1),
  ]),
  Level(63, [
    Platform(3, LevelType.minus, 1010, 1),
    Platform(1, LevelType.monster, 9090, 1),
  ]),
  Level(64, [
    Platform(1, LevelType.energy, 1, 1),
    Platform(3, LevelType.increment, 3330, 1),
  ]),
  Level(65, [
    Platform(4, LevelType.monster, 12300, 1),
  ]),
  Level(66, [
    Platform(2, LevelType.dec, 2, 1),
    Platform(2, LevelType.minus, 2700, 1),
  ]),
  Level(67, [
    Platform(3, LevelType.minus, 2960, 1),
    Platform(1, LevelType.dec, 2, 1),
  ]),
  Level(68, [
    Platform(2, LevelType.dec, 2, 1),
    Platform(2, LevelType.minus, 3260, 1),
  ]),
  Level(69, [
    Platform(1, LevelType.dec, 2, 1),
    Platform(2, LevelType.minus, 3580, 1),
    Platform(1, LevelType.minus, 1790, 1),
  ]),
  Level(70, [
    Platform(1, LevelType.increment, 13790, 1),
    Platform(2, LevelType.monster, 11820, 1),
    Platform(1, LevelType.energy, 1, 1),
  ]),
  Level(71, [
    Platform(2, LevelType.increment, 2170, 1),
    Platform(2, LevelType.minus, 2170, 1),
  ]),
  Level(72, [
    Platform(3, LevelType.upp, 2, 1),
    Platform(1, LevelType.increment, 19120, 1),
  ]),
  Level(73, [
    Platform(2, LevelType.increment, 21040, 1),
    Platform(2, LevelType.energy, 1, 1),
  ]),
  Level(74, [
    Platform(3, LevelType.monster, 28900, 1),
    Platform(1, LevelType.upp, 2, 1),
  ]),
  Level(75, [
    Platform(4, LevelType.monster, 31800, 1),
  ]),
  Level(76, [
    Platform(2, LevelType.increment, 3500, 1),
    Platform(2, LevelType.monster, 24500, 1),
  ]),
  Level(77, [
    Platform(1, LevelType.monster, 23100, 1),
    Platform(2, LevelType.monster, 19250, 1),
    Platform(1, LevelType.energy, 1, 1),
  ]),
  Level(78, [
    Platform(3, LevelType.increment, 6345, 1),
    Platform(1, LevelType.monster, 29610, 1),
  ]),
  Level(79, [
    Platform(1, LevelType.monster, 30290, 1),
    Platform(2, LevelType.increment, 4660, 1),
    Platform(1, LevelType.energy, 1, 1),
  ]),
  Level(80, [
    Platform(4, LevelType.monster, 61930, 1),
  ]),
];

void main() {
  String input =
      '61 2i25111 2m58591 1m73681 3q9211 3q10101 1m90901 1e11 3i33301 4m123001 2d21 2q27001 3q29601 1d21 2d21 2q32601 1d21 2q35801 1q17901 1i137901 2m118201 1e11 2i21701 2q21701 3u21 1i191201 2i210401 2e11 3m289001 1u21 4m318001 2i35001 2m245001 1m231001 2m192501 1e11 3i63451 1m296101 1m302901 2i46601 1e11 4m619301';

  // String d41to61 =
  //     ' 1u21 3i1861 1m23291 3m12331 3q10571 1i1511 1i1661 3m14941 4m18201 3i3001 1i2001 1q1101 2m19801 1m16501 1e11 2i2431 1m19441 1m24031 3i5341 4m2930 1q11311 2m2261 1e11 1u31 3u21 3m64741 1m39101 3e11 1i12901 1m70951 3i4731 2d21 2q41601 2e11 2m51451 1m72431 2m62901 1i12581 2i13841 2q10381 4m76101';
  //
  // input += d41to61;

  List<String> parts = input.split(' ');

  List<Level> levels = [];

  int currentLevelIndex = int.parse(parts[0]);

  List<Platform> currentPlatforms = [];

  int currentSize = 0;

  for (int i = 1; i < parts.length; i++) {
    String platformString = parts[i];

    LevelType type = LevelType.energy;
    switch (platformString[1]) {
      case 'i':
        type = LevelType.increment;
        break;
      case 'u':
        type = LevelType.upp;
        break;
      case 'm':
        type = LevelType.monster;
        break;
      case 'd':
        type = LevelType.dec;
        break;
      case 'q':
        type = LevelType.minus;
        break;
      case 'e':
        type = LevelType.energy;
        break;
    }

    int size = int.parse(platformString[0]);

    int dmg = int.parse(platformString.substring(2, platformString.length - 1));
    int index = int.parse(platformString[platformString.length - 1]);

    Platform platform = Platform(size, type, dmg, index);
    currentPlatforms.add(platform);
    currentSize += size;

    if (currentSize == 4) {
      levels.add(Level(currentLevelIndex, currentPlatforms));
      currentLevelIndex++;
      currentPlatforms = [];
      currentSize = 0;
    }
  }

  // Print generated code
  print("List<Level> levels = [");
  for (Level level in levels) {
    print("  Level(${level.index}, [");
    for (Platform platform in level.platforms) {
      String typeString;
      switch (platform.type) {
        case LevelType.increment:
          typeString = "increment";
          break;
        case LevelType.upp:
          typeString = "upp";
          break;
        case LevelType.minus:
          typeString = "minus";
          break;
        case LevelType.dec:
          typeString = "dec";
          break;
        case LevelType.monster:
          typeString = "monster";
          break;
        case LevelType.energy:
          typeString = "energy";
          break;
      }
      print("    Platform(${platform.size}, LevelType.${typeString}, ${platform.dmg}, ${platform.exp}),");
    }
    print("  ]),");
  }
  print("];");
}
