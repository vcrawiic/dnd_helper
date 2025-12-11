import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/pages/monsters/widgets/monster_info_widget.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final Monster monsterItem;

  const ListViewItem({super.key, required this.monsterItem});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
          color: const Color.fromRGBO(192, 59, 59, 1),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              monsterItem.name ?? 'Unknown',
              style: TextStyle(fontSize: 16, color: Pallete.secondaryBG),
            ),
          ),
        ),
      ),
      onTap: () {
        final item = monsterItem;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text(item.name ?? 'Monster Details'),
                  backgroundColor: Pallete.primaryBG,
                  surfaceTintColor: Colors.transparent,
                ),
                backgroundColor: Pallete.primaryBG,
                body: MonsterInfoWidget(monsterItem: item),
              ),
            ),
          );
        }
    );
  }
}
