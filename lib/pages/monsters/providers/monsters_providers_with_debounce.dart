import 'dart:async';
import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/models/monsters/monster_order.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchQueryNotifier extends StateNotifier<String> {
  SearchQueryNotifier() : super('');

  Timer? _debounce;

  void updateQuery(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      state = query;
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}

final searchQueryWithDebounceProvider = StateNotifierProvider<SearchQueryNotifier, String>(
  (ref) => SearchQueryNotifier(),
);

final monstersProvider = FutureProvider.family<List<Monster>, GraphQLService>(
  (ref, service) async {
    return service.fetchAllMonsters(
      MonsterOrder(
        orderDirection: MonsterOrderDirection.ASC,
        orderBy: MonsterOrderBy.CHALLENGE_RATING,
      ),
    );
  },
);

final filteredMonstersWithDebounceProvider = Provider.family<AsyncValue<List<Monster>>, GraphQLService>(
  (ref, service) {
    final monstersAsync = ref.watch(monstersProvider(service));
    final searchQuery = ref.watch(searchQueryWithDebounceProvider).toLowerCase();

    return monstersAsync.when(
      data: (monsterList) {
        if (searchQuery.isEmpty) {
          return AsyncValue.data(monsterList);
        }

        final filtered = monsterList.where((monster) {
          final name = monster.name?.toLowerCase() ?? '';
          final type = monster.type?.toLowerCase() ?? '';
          final size = monster.size?.name.toLowerCase() ?? '';

          return name.contains(searchQuery) ||
                 type.contains(searchQuery) ||
                 size.contains(searchQuery);
        }).toList();

        return AsyncValue.data(filtered);
      },
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
    );
  },
);
