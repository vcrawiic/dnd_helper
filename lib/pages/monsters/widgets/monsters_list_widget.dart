import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/monsters/providers/infinite_scroll_providers.dart';
import 'package:dnd_helper/pages/monsters/widgets/common/empty_widget.dart';
import 'package:dnd_helper/pages/monsters/widgets/common/error_state_widget.dart';
import 'package:dnd_helper/pages/monsters/widgets/common/load_more_indicator.dart';
import 'package:dnd_helper/pages/monsters/widgets/common/loading_indicator.dart';
import 'package:dnd_helper/pages/monsters/widgets/common/monsters_search_field.dart';
import 'package:dnd_helper/pages/monsters/widgets/common/result_counter.dart';
import 'package:dnd_helper/pages/monsters/widgets/list_view_item.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Адаптивная сетка: число колонок считается от ширины экрана
/// (1 колонка на телефоне, 2–3 на десктопе). Высота ячейки фиксирована.
const _monstersGridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 420,
  mainAxisExtent: 88,
  crossAxisSpacing: 12,
  mainAxisSpacing: 12,
);

class MonstersListWidget extends ConsumerStatefulWidget {
  const MonstersListWidget(this._service, {super.key});
  final GraphQLService _service;

  @override
  ConsumerState<MonstersListWidget> createState() => _MonstersListWidgetState();
}

class _MonstersListWidgetState extends ConsumerState<MonstersListWidget> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!mounted) return;
    if (_isBottom) {
      final searchQuery = ref.read(infiniteScrollSearchQueryProvider);
      if (searchQuery.isEmpty) {
        ref.read(infiniteScrollProvider(widget._service).notifier).loadMore();
      }
    }
  }

  /// На широком экране первая страница может не переполнить вьюпорт — тогда
  /// скролла нет и [_onScroll] не срабатывает. Догружаем следующие страницы,
  /// пока контент не станет прокручиваемым.
  void _maybeFillViewport() {
    if (!mounted || !_scrollController.hasClients) return;
    if (ref.read(infiniteScrollSearchQueryProvider).isNotEmpty) return;
    if (_scrollController.position.maxScrollExtent <= 0) {
      ref.read(infiniteScrollProvider(widget._service).notifier).loadMore();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(infiniteScrollSearchQueryProvider);
    final isSearching = searchQuery.isNotEmpty;
    final topPadding = MediaQuery.of(context).padding.top;

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _SearchFieldDelegate(
            topPadding: topPadding,
            child: MonstersSearchField(
              controller: _searchController,
              searchQuery: searchQuery,
              onClear: () {
                if (!mounted) return;
                _searchController.clear();
                ref.read(infiniteScrollSearchQueryProvider.notifier).update('');
                ref
                    .read(infiniteScrollProvider(widget._service).notifier)
                    .reset();
              },
              onChanged: (value) {
                if (!mounted) return;
                ref
                    .read(infiniteScrollSearchQueryProvider.notifier)
                    .update(value);
              },
            ),
          ),
        ),
        isSearching ? _buildSearchResults() : _buildInfiniteScrollList(),
      ],
    );
  }

  Widget _buildSearchResults() {
    final filteredMonstersAsync = ref.watch(
      filteredMonstersInfiniteProvider(widget._service),
    );
    final searchQuery = ref.watch(infiniteScrollSearchQueryProvider);

    return filteredMonstersAsync.when(
      data: (monsters) {
        if (monsters.isEmpty) {
          return SliverFillRemaining(
            child: EmptyWidget(message: 'No monsters found for "$searchQuery"'),
          );
        }

        return SliverMainAxisGroup(
          slivers: [
            SliverToBoxAdapter(child: ResultCounter(count: monsters.length)),
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120),
              sliver: SliverGrid(
                gridDelegate: _monstersGridDelegate,
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      ListViewItem(monsterItem: monsters[index]),
                  childCount: monsters.length,
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const SliverFillRemaining(child: LoadingIndicator()),
      error: (error, stack) =>
          SliverFillRemaining(child: ErrorStateWidget(error: error.toString())),
    );
  }

  Widget _buildInfiniteScrollList() {
    final state = ref.watch(infiniteScrollProvider(widget._service));

    // После отрисовки проверяем, переполнил ли контент вьюпорт; если нет —
    // подгружаем ещё (актуально для широких экранов).
    if (state.hasMoreData && !state.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _maybeFillViewport());
    }

    if (state.monsters.isEmpty && state.isLoading) {
      return const SliverFillRemaining(child: LoadingIndicator());
    }
    if (state.monsters.isEmpty && !state.isLoading) {
      return const SliverFillRemaining(
        child: EmptyWidget(message: 'No monsters found'),
      );
    }
    if (state.error != null && state.monsters.isEmpty) {
      return SliverFillRemaining(child: ErrorStateWidget(error: state.error!));
    }
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          sliver: SliverGrid(
            gridDelegate: _monstersGridDelegate,
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  ListViewItem(monsterItem: state.monsters[index]),
              childCount: state.monsters.length,
            ),
          ),
        ),
        // Индикатор подгрузки — отдельным блоком на всю ширину под сеткой.
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 120, top: 12),
            child: state.hasMoreData
                ? LoadMoreIndicator(isLoading: state.isLoading)
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}

class _SearchFieldDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double topPadding;
  static const double _titleHeight = 50.0;
  static const double _searchHeight = 56.0;

  _SearchFieldDelegate({required this.child, required this.topPadding});

  @override
  double get minExtent => _searchHeight + topPadding;

  @override
  double get maxExtent => _searchHeight + topPadding + _titleHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final titleOpacity = (1 - shrinkOffset / _titleHeight).clamp(0.0, 1.0);

    return SizedBox.expand(
      child: Column(
        children: [
          SizedBox(height: topPadding),
          Opacity(
            opacity: titleOpacity,
            child: SizedBox(
              height: (_titleHeight - shrinkOffset).clamp(0.0, _titleHeight),
              child: const Center(
                child: Text(
                  'D&D Bestiary',
                  style: TextStyle(fontSize: 24, color: Pallete.primaryBG),
                ),
              ),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SearchFieldDelegate oldDelegate) {
    return true;
  }
}
