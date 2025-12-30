import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/pages/monsters/widgets/monster_info_widget.dart';
import 'package:flutter/material.dart';

class MonsterInfoPage extends StatelessWidget {
  final Monster monsterItem;
  const MonsterInfoPage({super.key, required this.monsterItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/dung.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Pallete.primaryWhiteText),
          title: Text(
            monsterItem.name ?? 'Monster Details',
            style: TextStyle(color: Pallete.primaryWhiteText),
          ),
          backgroundColor: Pallete.transparent,
          surfaceTintColor: Pallete.transparent,
        ),
        backgroundColor: Pallete.transparent,
        body: MonsterInfoWidget(monsterItem: monsterItem),
      ),
    );
  }
}
