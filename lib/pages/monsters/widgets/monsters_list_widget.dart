import 'package:dnd_helper/pages/monsters/providers/pagination_providers.dart';
import 'package:dnd_helper/pages/monsters/widgets/list_view_item.dart';
import 'package:dnd_helper/pages/monsters/widgets/pagination_widget.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonstersListWidget extends ConsumerWidget {
  const MonstersListWidget(this._service, {super.key});
  final GraphQLService _service;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayedMonstersAsync = ref.watch(
      displayedMonstersProvider(_service),
    );
    final searchQuery = ref.watch(searchQueryProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search monsters...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[100],
              suffixIcon: searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        ref.read(searchQueryProvider.notifier).state = '';
                      },
                    )
                  : null,
            ),
            onChanged: (value) {
              ref.read(searchQueryProvider.notifier).state = value;
              if (value.isEmpty) {
                ref.read(currentPageProvider.notifier).state = 1;
              }
            },
          ),
        ),
        Expanded(
          child: displayedMonstersAsync.when(
            data: (result) {
              if (result.monsters.isEmpty) {
                return Center(
                  child: Text(
                    searchQuery.isNotEmpty
                        ? 'No monsters found for "$searchQuery"'
                        : 'No monsters found',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                );
              }

              return Stack(
                children: [
                  Column(
                    children: [
                      if (searchQuery.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Text(
                            'Found ${result.monsters.length} monster(s)',
                            style:
                                TextStyle(color: Colors.grey[600], fontSize: 14),
                          ),
                        ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: result.isPaginated ? 60 : 16,
                          ),
                          itemCount: result.monsters.length,
                          itemBuilder: (context, index) {
                            final monster = result.monsters[index];
                            return ListViewItem(monsterItem: monster);
                          },
                        ),
                      ),
                    ],
                  ),
                  if (result.isPaginated)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.white.withAlpha(100),
                        child: PaginationWidget(totalCount: result.totalCount),
                      ),
                    ),
                ],
              );
            },
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            error: (error, stack) => Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('Error loading monsters: $error'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
