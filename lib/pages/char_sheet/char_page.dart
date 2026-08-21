import 'package:dnd_helper/pages/char_sheet/widgets/general_info.dart';
import 'package:flutter/material.dart';

class CharPage extends StatelessWidget {
  final String characterId;

  const CharPage({super.key, required this.characterId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Character Sheet')),
      body: Column(children: [GeneralInfo(characterId: characterId)]),
    );
  }
}
