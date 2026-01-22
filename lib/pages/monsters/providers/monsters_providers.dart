import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/models/monsters/monster_order.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'monsters_providers.g.dart';

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void update(String query) => state = query;

  void clear() => state = '';
}

@riverpod
Future<List<Monster>> monsters(Ref ref, GraphQLService service) async {
  return service.fetchAllMonsters(
    MonsterOrder(
      orderDirection: MonsterOrderDirection.ASC,
      orderBy: MonsterOrderBy.NAME,
    ),
  );
}

@riverpod
AsyncValue<List<Monster>> filteredMonsters(
  Ref ref,
  GraphQLService service,
) {
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
}
