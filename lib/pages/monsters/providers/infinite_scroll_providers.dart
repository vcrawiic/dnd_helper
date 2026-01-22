import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/models/monsters/monster_order.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'infinite_scroll_providers.g.dart';

const int monstersPerPage = 20;

class InfiniteScrollState {
  final List<Monster> monsters;
  final bool isLoading;
  final bool hasMoreData;
  final int currentPage;
  final String? error;

  const InfiniteScrollState({
    required this.monsters,
    required this.isLoading,
    required this.hasMoreData,
    required this.currentPage,
    this.error,
  });

  factory InfiniteScrollState.initial() => const InfiniteScrollState(
        monsters: [],
        isLoading: false,
        hasMoreData: true,
        currentPage: 0,
      );

  InfiniteScrollState copyWith({
    List<Monster>? monsters,
    bool? isLoading,
    bool? hasMoreData,
    int? currentPage,
    String? error,
  }) {
    return InfiniteScrollState(
      monsters: monsters ?? this.monsters,
      isLoading: isLoading ?? this.isLoading,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      currentPage: currentPage ?? this.currentPage,
      error: error ?? this.error,
    );
  }
}

@riverpod
class InfiniteScroll extends _$InfiniteScroll {
  late final GraphQLService _service;
  bool _disposed = false;

  @override
  InfiniteScrollState build(GraphQLService service) {
    _service = service;
    _disposed = false;

    ref.onDispose(() {
      _disposed = true;
    });

    Future.microtask(() => loadInitial());
    return InfiniteScrollState.initial();
  }

  Future<void> loadInitial() async {
    if (_disposed) return;
    state = state.copyWith(monsters: [], currentPage: 0, hasMoreData: true);
    await loadMore();
  }

  Future<void> loadMore() async {
    if (_disposed) return;
    if (state.isLoading || !state.hasMoreData) return;

    state = state.copyWith(isLoading: true);

    try {
      final nextPage = state.currentPage + 1;
      final skip = (nextPage - 1) * monstersPerPage;

      await Future.delayed(const Duration(milliseconds: 500));

      if (_disposed) return;

      final result = await _service.fetchMonsters(
        MonsterOrder(
          orderDirection: MonsterOrderDirection.ASC,
          orderBy: MonsterOrderBy.NAME,
        ),
        limit: monstersPerPage,
        skip: skip,
      );

      if (_disposed) return;

      final newMonsters = result?.data?.monsters ?? [];
      final hasMore = newMonsters.length >= monstersPerPage;

      state = state.copyWith(
        monsters: [...state.monsters, ...newMonsters],
        isLoading: false,
        hasMoreData: hasMore,
        currentPage: nextPage,
      );
    } catch (e) {
      if (_disposed) return;
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void reset() {
    if (_disposed) return;
    state = InfiniteScrollState.initial();
    loadInitial();
  }
}

@riverpod
Future<List<Monster>> allMonsters(Ref ref, GraphQLService service) async {
  return service.fetchAllMonsters(
    MonsterOrder(
      orderDirection: MonsterOrderDirection.ASC,
      orderBy: MonsterOrderBy.NAME,
    ),
  );
}

@riverpod
class InfiniteScrollSearchQuery extends _$InfiniteScrollSearchQuery {
  @override
  String build() => '';

  void update(String query) => state = query;
}

@riverpod
AsyncValue<List<Monster>> filteredMonstersInfinite(
  Ref ref,
  GraphQLService service,
) {
  final monstersAsync = ref.watch(allMonstersProvider(service));
  final searchQuery = ref.watch(infiniteScrollSearchQueryProvider).toLowerCase();

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
