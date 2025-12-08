import 'package:dnd_helper/models/monsters/monster.dart';
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
          color: Colors.blueAccent.shade100,
          child: Row(
            spacing: 16,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
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
              Text(monsterItem.name ?? 'Unknown', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text(monsterItem.name ?? 'test'),
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.transparent,
              ),
              backgroundColor: Colors.white,
              // TODO: Implement MonsterInfoWidget
              body: Placeholder(),
            ),
          ),
        );
      },
    );
  }
}
