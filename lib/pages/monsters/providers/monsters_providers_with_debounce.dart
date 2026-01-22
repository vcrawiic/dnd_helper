import 'dart:async';
import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/models/monsters/monster_order.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'monsters_providers_with_debounce.g.dart';

@riverpod
class SearchQueryWithDebounce extends _$SearchQueryWithDebounce {
  Timer? _debounce;

  @override
  String build() {
    ref.onDispose(() {
      _debounce?.cancel();
    });
    return '';
  }

  void updateQuery(String query) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      state = query;
    });
  }

  void clear() {
    _debounce?.cancel();
    state = '';
  }
}

@riverpod
Future<List<Monster>> monstersWithDebounce(
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
AsyncValue<List<Monster>> filteredMonstersWithDebounce(
  Ref ref,
  GraphQLService service,
) {
  final monstersAsync = ref.watch(monstersWithDebounceProvider(service));
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
}
