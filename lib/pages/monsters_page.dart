import 'package:dnd_helper/models/monsters_info/monster_order.dart';
import 'package:dnd_helper/models/monsters_info/monsters.dart';
import 'package:dnd_helper/pages/widgets/monsters_list_widget.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonstersPage extends StatelessWidget {
  const MonstersPage(this._service, {super.key});
  final GraphQLService _service;

  FutureProvider<Monsters?> get monstersProvider =>
      FutureProvider<Monsters?>((ref) async {
        return _service.fetchMonsters(
          MonsterOrder(
            orderDirection: MonsterOrderDirection.ASC,
            orderBy: MonsterOrderBy.CHALLENGE_RATING,
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('D&D Bestiary'),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: MonstersListWidget(monstersProvider),
    );
  }
}
