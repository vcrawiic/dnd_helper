import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/models/monsters/monster_order.dart';
import 'package:dnd_helper/models/monsters/monsters.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageProvider = StateProvider<int>((ref) => 1);

final searchQueryProvider = StateProvider<String>((ref) => '');

const int monstersPerPage = 50;

final paginatedMonstersProvider = FutureProvider.family<Monsters?, GraphQLService>(
  (ref, service) async {
    final currentPage = ref.watch(currentPageProvider);
    final skip = (currentPage - 1) * monstersPerPage;

    return service.fetchMonsters(
      MonsterOrder(
        orderDirection: MonsterOrderDirection.ASC,
        orderBy: MonsterOrderBy.CHALLENGE_RATING,
      ),
      limit: monstersPerPage,
      skip: skip,
    );
  },
);

final allMonstersProvider = FutureProvider.family<List<Monster>, GraphQLService>(
  (ref, service) async {
    return service.fetchAllMonsters(
      MonsterOrder(
        orderDirection: MonsterOrderDirection.ASC,
        orderBy: MonsterOrderBy.CHALLENGE_RATING,
      ),
    );
  },
);

final displayedMonstersProvider = Provider.family<AsyncValue<DisplayedMonstersResult>, GraphQLService>(
  (ref, service) {
    final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

    if (searchQuery.isNotEmpty) {
      final allMonstersAsync = ref.watch(allMonstersProvider(service));

      return allMonstersAsync.when(
        data: (allMonsters) {
          final filtered = allMonsters.where((monster) {
            final name = monster.name?.toLowerCase() ?? '';
            final type = monster.type?.toLowerCase() ?? '';
            final size = monster.size?.name.toLowerCase() ?? '';

            return name.contains(searchQuery) ||
                   type.contains(searchQuery) ||
                   size.contains(searchQuery);
          }).toList();

          return AsyncValue.data(DisplayedMonstersResult(
            monsters: filtered,
            totalCount: filtered.length,
            isPaginated: false,
          ));
        },
        loading: () => const AsyncValue.loading(),
        error: (error, stack) => AsyncValue.error(error, stack),
      );
    }

    final paginatedAsync = ref.watch(paginatedMonstersProvider(service));

    return paginatedAsync.when(
      data: (monsters) {
        final monsterList = monsters?.data?.monsters ?? [];

        final currentPage = ref.watch(currentPageProvider);
        final estimatedTotal = monsterList.length < monstersPerPage
            ? (currentPage - 1) * monstersPerPage + monsterList.length
            : currentPage * monstersPerPage + 1; // +1 чтобы показать что есть еще

        return AsyncValue.data(DisplayedMonstersResult(
          monsters: monsterList,
          totalCount: estimatedTotal,
          isPaginated: true,
        ));
      },
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
    );
  },
);

class DisplayedMonstersResult {
  final List<Monster> monsters;
  final int totalCount;
  final bool isPaginated; 

  DisplayedMonstersResult({
    required this.monsters,
    required this.totalCount,
    required this.isPaginated,
  });
}
