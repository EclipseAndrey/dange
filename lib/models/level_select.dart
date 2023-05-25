class LevelSelect {
  final int level;
  int platform;

  LevelSelect(this.level, this.platform);

  @override
  String toString() {
    return 'LS $level ${platform}';
  }
}
