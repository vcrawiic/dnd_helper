import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:flutter/material.dart';

class MonsterInfoWidget extends StatelessWidget {
  const MonsterInfoWidget({super.key, required this.monsterItem});

  final Monster monsterItem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Row(
          children: [
            // MARK: - Left side widgets
            Column(
              children: [
                Column(
                  children: [
                    Text('Tarrasque', style: TextStyle(fontSize: 36, color: Pallete.primaryText)),
                    Text(
                      '(monstrosity)',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Pallete.secondaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // MARK: - Right side widgets
            Column(),
          ],
        ),
      ),
    );
  }
}
