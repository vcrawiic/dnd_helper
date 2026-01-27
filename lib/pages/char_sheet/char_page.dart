import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/general_info.dart';
import 'package:flutter/material.dart';

class CharPage extends StatelessWidget {
  const CharPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Изменить userId на characterId, тк будет несколько персонажей
    final characterId = GlobalDependencies.authService.currentUser?.uid ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text('Character Sheet')),
      body: Column(
        children: [
          GeneralInfo(characterId: characterId),
        ],
      ),
    );
  }
}
