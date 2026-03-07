import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class HpDisplay extends StatelessWidget {
  final int current;
  final int max;
  final int temp;
  const HpDisplay({
    super.key,
    required this.current,
    required this.max,
    required this.temp,
  });
  Color get _hpColor {
    if (current <= 0) return Pallete.primary;
    if (current <= max ~/ 2) return Pallete.hpBloodied;
    return Pallete.hpHealthy;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Icon(Icons.monitor_heart_outlined, color: _hpColor),
          Text('$current / $max', style: TextStyle(color: _hpColor)),
          if (temp > 0) Text(' (+$temp temp)'),
        ],
      ),
    );
  }
}
