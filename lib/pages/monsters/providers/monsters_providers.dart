import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/models/monsters/monster_order.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

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

final filteredMonstersProvider = Provider.family<AsyncValue<List<Monster>>, GraphQLService>(
  (ref, service) {
    final monstersAsync = ref.watch(monstersProvider(service));
    final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

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
