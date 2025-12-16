import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/monsters/providers/infinite_scroll_providers.dart';
import 'package:dnd_helper/pages/monsters/widgets/list_view_item.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    if (_isBottom) {
      final searchQuery = ref.read(searchQueryProvider);
      if (searchQuery.isEmpty) {
        ref
            .read(infiniteScrollProvider(widget._service).notifier)
            .loadMore();
      }
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
    final searchQuery = ref.watch(searchQueryProvider);
    final isSearching = searchQuery.isNotEmpty;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(

              hintText: 'Search monsters...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Pallete.primaryBG,
              suffixIcon: searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        ref.read(searchQueryProvider.notifier).state = '';
                        ref
                            .read(infiniteScrollProvider(widget._service).notifier)
                            .reset();
                      },
                    )
                  : const Icon(Icons.search),
            ),
            onChanged: (value) {
              ref.read(searchQueryProvider.notifier).state = value;
            },
          ),
        ),
        Expanded(
          child: isSearching
              ? _buildSearchResults()
              : _buildInfiniteScrollList(),
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    final filteredMonstersAsync = ref.watch(
      filteredMonstersProvider(widget._service),
    );
    final searchQuery = ref.watch(searchQueryProvider);

    return filteredMonstersAsync.when(
      data: (monsters) {
        if (monsters.isEmpty) {
          return _buildEmptyState('No monsters found for "$searchQuery"');
        }

        return Column(
          children: [
            _buildResultsCounter(monsters.length),
            Expanded(
              child: _buildMonstersList(
                monsters: monsters,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ],
        );
      },
      loading: () => _buildLoadingIndicator(),
      error: (error, stack) => _buildErrorState(error.toString()),
    );
  }

  Widget _buildInfiniteScrollList() {
    final state = ref.watch(infiniteScrollProvider(widget._service));

    if (state.monsters.isEmpty && state.isLoading) {
      return _buildLoadingIndicator();
    }

    if (state.monsters.isEmpty && !state.isLoading) {
      return _buildEmptyState('No monsters found');
    }

    if (state.error != null && state.monsters.isEmpty) {
      return _buildErrorState(state.error!);
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
      itemCount: state.monsters.length + (state.hasMoreData ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= state.monsters.length) {
          return _buildLoadMoreIndicator(state.isLoading);
        }
        return ListViewItem(monsterItem: state.monsters[index]);
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator.adaptive());
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text('Error loading monsters: $error'),
      ),
    );
  }

  Widget _buildResultsCounter(int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        'Found $count monster(s)',
        style: TextStyle(color: Colors.grey[600], fontSize: 14),
      ),
    );
  }

  Widget _buildMonstersList({
    required List monsters,
    required EdgeInsets padding,
    ScrollController? controller,
  }) {
    return ListView.builder(
      controller: controller,
      padding: padding,
      itemCount: monsters.length,
      itemBuilder: (context, index) => ListViewItem(monsterItem: monsters[index]),
    );
  }

  Widget _buildLoadMoreIndicator(bool isLoading) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : const SizedBox.shrink(),
      ),
    );
  }
}
