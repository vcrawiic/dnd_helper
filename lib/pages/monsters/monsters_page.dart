import 'package:dnd_helper/pages/monsters/widgets/monsters_list_widget.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter/material.dart';

class MonstersPage extends StatelessWidget {
  const MonstersPage(this._service, {super.key});
  final GraphQLService _service;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/dung.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: MonstersListWidget(_service),
      ),
    );
  }
}
