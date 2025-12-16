import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/models/monsters/monster_order.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

const int monstersPerPage = 20;

class InfiniteScrollState {
  final List<Monster> monsters;
  final bool isLoading;
  final bool hasMoreData;
  final int currentPage;
  final String? error;

  InfiniteScrollState({
    required this.monsters,
    required this.isLoading,
    required this.hasMoreData,
    required this.currentPage,
    this.error,
  });

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

class InfiniteScrollNotifier extends StateNotifier<InfiniteScrollState> {
  final GraphQLService service;

  InfiniteScrollNotifier(this.service)
      : super(InfiniteScrollState(
          monsters: [],
          isLoading: false,
          hasMoreData: true,
          currentPage: 0,
        )) {
    loadInitial();
  }

  Future<void> loadInitial() async {
    if (!mounted) return;
    state = state.copyWith(monsters: [], currentPage: 0, hasMoreData: true);
    await loadMore();
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMoreData) return;
    if (!mounted) return;

    state = state.copyWith(isLoading: true);

    try {
      final nextPage = state.currentPage + 1;
      final skip = (nextPage - 1) * monstersPerPage;

      await Future.delayed(const Duration(milliseconds: 500));

      final result = await service.fetchMonsters(
        MonsterOrder(
          orderDirection: MonsterOrderDirection.ASC,
          orderBy: MonsterOrderBy.CHALLENGE_RATING,
        ),
        limit: monstersPerPage,
        skip: skip,
      );

      if (!mounted) return;

      final newMonsters = result?.data?.monsters ?? [];
      final hasMore = newMonsters.length >= monstersPerPage;

      state = state.copyWith(
        monsters: [...state.monsters, ...newMonsters],
        isLoading: false,
        hasMoreData: hasMore,
        currentPage: nextPage,
      );
    } catch (e) {
      if (!mounted) return;
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void reset() {
    if (!mounted) return;
    state = InfiniteScrollState(
      monsters: [],
      isLoading: false,
      hasMoreData: true,
      currentPage: 0,
    );
    loadInitial();
  }
}

final infiniteScrollProvider =
    StateNotifierProvider.family<InfiniteScrollNotifier, InfiniteScrollState, GraphQLService>(
  (ref, service) => InfiniteScrollNotifier(service),
);

final allMonstersProvider =
    FutureProvider.family<List<Monster>, GraphQLService>(
  (ref, service) async {
    return service.fetchAllMonsters(
      MonsterOrder(
        orderDirection: MonsterOrderDirection.ASC,
        orderBy: MonsterOrderBy.CHALLENGE_RATING,
      ),
    );
  },
);

final filteredMonstersProvider =
    Provider.family<AsyncValue<List<Monster>>, GraphQLService>(
  (ref, service) {
    final monstersAsync = ref.watch(allMonstersProvider(service));
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
