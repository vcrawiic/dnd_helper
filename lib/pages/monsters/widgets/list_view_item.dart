import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListViewItem extends StatelessWidget {
  final Monster monsterItem;

  const ListViewItem({super.key, required this.monsterItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: LiquidContainer(
        radius: 12,
        child: Card(
          color: Pallete.primaryAlpha100,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              monsterItem.name ?? 'Unknown',
              style: TextStyle(fontSize: 21, color: Pallete.primaryWhiteText),
            ),
          ),
        ),
      ),
      onTap: () {
        context.push('/reference/monsters/info', extra: monsterItem);
      },
    );
  }
}
