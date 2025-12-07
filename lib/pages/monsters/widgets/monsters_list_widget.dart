import 'package:dnd_helper/models/monsters_info/monster.dart';
import 'package:dnd_helper/models/monsters_info/monsters.dart';
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

            return ListView.builder(
              itemCount: monsterList.length,
              itemBuilder: (context, index) {
                final monster = monsterList[index];
                return ListViewItem(monsterItem: monster);
              },
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

class ListViewItem extends StatelessWidget {
  final Monster monsterItem;

  const ListViewItem({super.key, required this.monsterItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.blueAccent.shade100,
        child: Center(child: Text(monsterItem.name ?? 'Unknown')),
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
