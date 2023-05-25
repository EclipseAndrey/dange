import 'package:dange/models/level.dart';
import 'package:dange/models/platform.dart';
import 'package:dange/models/type.dart';
import 'package:flutter/material.dart';

class LevelWidget extends StatelessWidget {
  final Level level;
  final int? indexSelect;
  const LevelWidget({this.indexSelect, required this.level, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double initSize = 160;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8),
      child: SizedBox(
        width: initSize,
        height: initSize * 4 + 16 * 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            level.platforms.length,
            (index) => PlatformWidget(
              platform: level.platforms[index],
              initSize: initSize,
              selected: index == indexSelect,
            ),
          ),
        ),
      ),
    );
  }
}

class PlatformWidget extends StatelessWidget {
  final double initSize;
  final Platform platform;
  final bool selected;
  const PlatformWidget({required this.selected, required this.platform, required this.initSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color activeColor = Colors.yellow.withOpacity(0.8);

    Color color = Colors.black.withOpacity(0.2);

    switch (platform.type) {
      case LevelType.monster:
        color = Colors.black.withOpacity(0.1);
        break;
      case LevelType.increment:
        color = Colors.blue.withOpacity(0.2);
        break;
      case LevelType.upp:
        color = Colors.yellow.withOpacity(0.2);
        break;
      case LevelType.minus:
        color = Colors.red.withOpacity(0.2);
        break;
      case LevelType.dec:
        color = Colors.red.withOpacity(0.2);
        break;
      case LevelType.energy:
        color = Colors.lightBlueAccent.withOpacity(0.1);
        break;
    }

    if (platform.size == 1) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          height: initSize,
          width: initSize,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              if (selected)
                BoxShadow(
                  color: activeColor,
                  spreadRadius: 5,
                )
            ],
          ),
          child: PlatformContent(
            platform: platform,
          ),
        ),
      );
    }
    if (platform.size == 2) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          height: initSize * 2 + 16,
          width: initSize,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              if (selected)
                BoxShadow(
                  color: activeColor,
                  spreadRadius: 5,
                )
            ],
          ),
          child: PlatformContent(
            platform: platform,
          ),
        ),
      );
    }
    if (platform.size == 3) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          height: initSize * 3 + 16 * 2,
          width: initSize,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              if (selected)
                BoxShadow(
                  color: activeColor,
                  spreadRadius: 5,
                )
            ],
          ),
          child: PlatformContent(
            platform: platform,
          ),
        ),
      );
    }
    if (platform.size == 4) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          height: initSize * 4 + 16 * 3,
          width: initSize,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              if (selected)
                BoxShadow(
                  color: activeColor,
                  spreadRadius: 5,
                )
            ],
          ),
          child: PlatformContent(
            platform: platform,
          ),
        ),
      );
    }
    return const SizedBox();
  }
}

class PlatformContent extends StatelessWidget {
  final Platform platform;
  const PlatformContent({required this.platform, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black.withOpacity(0.2);
    String prefix = '';
    String imgPath = 'assets/monster.png';

    switch (platform.type) {
      case LevelType.monster:
        color = Colors.black;
        imgPath = 'assets/monster.png';
        prefix = '';
        break;
      case LevelType.increment:
        color = Colors.blue;
        prefix = '+';
        imgPath = 'assets/increment.png';

        break;
      case LevelType.upp:
        color = Colors.blue;
        prefix = '*';
        imgPath = 'assets/upp.png';

        break;
      case LevelType.minus:
        color = Colors.red;
        imgPath = 'assets/minus.png';

        prefix = '–';
        break;
      case LevelType.dec:
        color = Colors.red;
        imgPath = 'assets/dec.png';

        prefix = '/';

        break;
      case LevelType.energy:
        color = Colors.blue;
        imgPath = 'assets/energy.png';

        prefix = 'ENERGY ';
        break;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imgPath,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              prefix + platform.dmg.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
