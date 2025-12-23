import 'package:dnd_helper/pages/monsters/widgets/list_view_item.dart';
import 'package:flutter/material.dart';

class MonsterList extends StatelessWidget {
  final List monsters;
  final EdgeInsets padding;
  final ScrollController? controller;

  const MonsterList({
    super.key,
    required this.monsters,
    required this.padding,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: padding,
      itemCount: monsters.length,
      itemBuilder: (context, index) =>
          ListViewItem(monsterItem: monsters[index]),
    );
  }
}
