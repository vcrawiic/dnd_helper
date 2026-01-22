import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/models/monsters/monster_order.dart';
import 'package:dnd_helper/models/monsters/monsters.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pagination_providers.g.dart';

const int monstersPerPage = 50;

@riverpod
class CurrentPage extends _$CurrentPage {
  @override
  int build() => 1;

  void setPage(int page) => state = page;

  void nextPage() => state++;

  void previousPage() {
    if (state > 1) state--;
  }
}

@riverpod
class PaginationSearchQuery extends _$PaginationSearchQuery {
  @override
  String build() => '';

  void update(String query) => state = query;

  void clear() => state = '';
}

@riverpod
Future<Monsters?> paginatedMonsters(
  Ref ref,
  GraphQLService service,
) async {
  final currentPage = ref.watch(currentPageProvider);
  final skip = (currentPage - 1) * monstersPerPage;

  return service.fetchMonsters(
    MonsterOrder(
      orderDirection: MonsterOrderDirection.ASC,
      orderBy: MonsterOrderBy.NAME,
    ),
    limit: monstersPerPage,
    skip: skip,
  );
}

@riverpod
Future<List<Monster>> allMonstersPagination(
  Ref ref,
  GraphQLService service,
) async {
  return service.fetchAllMonsters(
    MonsterOrder(
      orderDirection: MonsterOrderDirection.ASC,
      orderBy: MonsterOrderBy.NAME,
    ),
  );
}

@riverpod
AsyncValue<DisplayedMonstersResult> displayedMonsters(
  Ref ref,
  GraphQLService service,
) {
  final searchQuery = ref.watch(paginationSearchQueryProvider).toLowerCase();

  if (searchQuery.isNotEmpty) {
    final allMonstersAsync = ref.watch(allMonstersPaginationProvider(service));

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
          : currentPage * monstersPerPage + 1;

      return AsyncValue.data(DisplayedMonstersResult(
        monsters: monsterList,
        totalCount: estimatedTotal,
        isPaginated: true,
      ));
    },
    loading: () => const AsyncValue.loading(),
    error: (error, stack) => AsyncValue.error(error, stack),
  );
}

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
