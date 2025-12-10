import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/monsters/widgets/monsters_list_widget.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter/material.dart';

class MonstersPage extends StatelessWidget {
  const MonstersPage(this._service, {super.key});
  final GraphQLService _service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryBG,
      appBar: AppBar(
        centerTitle: true,
        title: Text('D&D Bestiary'),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Pallete.primaryBG,
      ),
      body: MonstersListWidget(_service),
    );
  }
}
