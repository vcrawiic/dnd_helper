import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/pages/monsters/widgets/monster_info_widget.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final Monster monsterItem;

  const ListViewItem({super.key, required this.monsterItem});

  @override
  Widget build(BuildContext context) {
    final imageUrl = monsterItem.image != null
        ? 'https://www.dnd5eapi.co${monsterItem.image}'
        : '';

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
          color: Pallete.primary,
          child: Row(
            spacing: 16,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  image: imageUrl.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: imageUrl.isEmpty
                    ? Icon(Icons.image_not_supported, color: Colors.grey)
                    : null,
              ),
              Text(
                monsterItem.name ?? 'Unknown',
                style: TextStyle(fontSize: 16, color: Pallete.secondaryBG),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        final item = monsterItem;
        if (item != null) {
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
      },
    );
  }
}
