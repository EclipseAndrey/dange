import 'package:dange/models/type.dart';

class Platform {
  final int size;
  final LevelType type;
  final int dmg;
  final int exp;

  Platform(this.size, this.type, this.dmg, this.exp);

  @override
  String toString() {
    return 'Platform{size: $size, type: $type, dmg: $dmg}';
  }
}
