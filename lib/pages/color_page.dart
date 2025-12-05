import 'package:flutter/material.dart';

class ColorPageArgs {
  final Color baseColor;
  final int level;
  ColorPageArgs({required this.baseColor, required this.level});
}

class ColorPage extends StatelessWidget {
  final Color baseColor;
  final int level;

  const ColorPage({super.key, required this.baseColor, required this.level});

  Color adjustColor(Color color, int level) {
    double factor = 1 - (level * 0.1);
    factor = factor.clamp(0.2, 1.0);
    return Color.fromARGB(
      255,
      (color.red * factor).toInt(),
      (color.green * factor).toInt(),
      (color.blue * factor).toInt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final adjusted = adjustColor(baseColor, level);

    return Scaffold(
      backgroundColor: adjusted,
      appBar: AppBar(title: Text('Level $level'), backgroundColor: adjusted),
      body: Center(
        child: level < 3
            ? ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/colorPage',
                  arguments: ColorPageArgs(
                    baseColor: baseColor,
                    level: level + 1,
                  ),
                ),
                child: Text('Go deeper (level ${level + 1})'),
              )
            : ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back one level'),
              ),
      ),
    );
  }
}
