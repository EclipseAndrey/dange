import 'package:dange/models/level_select.dart';

class VariantResult {
  final int totalBS;
  final List<LevelSelect> levelsSelect;
  final int lvl;
  final int energy;
  final List<String> message;

  VariantResult(this.totalBS, this.levelsSelect, this.lvl, this.energy, this.message);

  @override
  String toString() {
    return 'VariantResult{lvl: $lvl en: $energy totalBS: ${totalBS}k, levelsSelect: $levelsSelect}\n';
  }
}
