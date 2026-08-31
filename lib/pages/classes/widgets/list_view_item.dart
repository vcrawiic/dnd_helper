import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/classes/class.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListViewItem extends StatelessWidget {
  final Class? classItem;

  const ListViewItem({super.key, required this.classItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: LiquidContainer(
        radius: 12,
        child: Card(
          color: Pallete.primaryAlpha100,
          child: Center(
            child: Text(
              classItem?.name ?? 'Unknown',
              style: TextStyle(color: Pallete.secondaryBG, fontSize: 21),
            ),
          ),
        ),
      ),
      onTap: () {
        final item = classItem;
        if (item != null) {
          context.push('/reference/classes/info', extra: item);
        }
      },
    );
  }
}
