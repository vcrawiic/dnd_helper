import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/models/monsters/monsters.dart';
import 'package:dnd_helper/pages/monsters/widgets/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonstersListWidget extends StatelessWidget {
  const MonstersListWidget(this._provider, {super.key});
  final FutureProvider<Monsters?> _provider;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final monstersAsyncValue = ref.watch(_provider);

        return monstersAsyncValue.when(
          data: (monsters) {
            final monsterList = monsters?.data?.monsters ?? [];

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search monsters...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount: monsterList.length,
                      itemBuilder: (context, index) {
                        final monster = monsterList[index];
                        return ListViewItem(monsterItem: monster);
                      },
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => Center(child: CircularProgressIndicator.adaptive()),
          error: (error, stack) => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Error loading monsters: $error'),
            ),
          ),
        );
      },
    );
  }
}
