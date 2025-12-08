import 'package:dnd_helper/pages/monsters/providers/pagination_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaginationWidget extends ConsumerWidget {
  const PaginationWidget({
    super.key,
    required this.totalCount,
  });

  final int totalCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    final totalPages = (totalCount / monstersPerPage).ceil();

    if (totalPages <= 1) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: currentPage > 1
                ? () {
                    ref.read(currentPageProvider.notifier).state =
                        currentPage - 1;
                  }
                : null,
            icon: const Icon(Icons.chevron_left),
            tooltip: 'Previous page',
          ),
          const SizedBox(width: 8),
          ..._buildPageNumbers(context, currentPage, totalPages, ref),
          const SizedBox(width: 8),
          IconButton(
            onPressed: currentPage < totalPages
                ? () {
                    ref.read(currentPageProvider.notifier).state =
                        currentPage + 1;
                  }
                : null,
            icon: const Icon(Icons.chevron_right),
            tooltip: 'Next page',
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageNumbers(
    BuildContext context,
    int currentPage,
    int totalPages,
    WidgetRef ref,
  ) {
    List<Widget> pageButtons = [];

  

    const int delta = 2; 

    for (int i = 1; i <= totalPages; i++) {
      if (i == 1) {
        pageButtons.add(_buildPageButton(context, i, currentPage, ref));
        continue;
      }

      if (i == totalPages) {
        if (currentPage < totalPages - delta - 1) {
          pageButtons.add(_buildDots());
        }
        pageButtons.add(_buildPageButton(context, i, currentPage, ref));
        continue;
      }

      if (i >= currentPage - delta && i <= currentPage + delta) {
        if (i == currentPage - delta && currentPage > delta + 2) {
          pageButtons.add(_buildDots());
        }

        pageButtons.add(_buildPageButton(context, i, currentPage, ref));
        continue;
      }
    }

    return pageButtons;
  }

  Widget _buildPageButton(
    BuildContext context,
    int pageNumber,
    int currentPage,
    WidgetRef ref,
  ) {
    final isCurrentPage = pageNumber == currentPage;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: isCurrentPage
            ? null
            : () {
                ref.read(currentPageProvider.notifier).state = pageNumber;
              },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          child: Text(
            '$pageNumber',
            style: TextStyle(
              color: isCurrentPage
                  ? Theme.of(context).primaryColor
                  : Colors.grey[700],
              fontWeight: isCurrentPage ? FontWeight.bold : FontWeight.w500,
              fontSize: isCurrentPage ? 18 : 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDots() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Center(
          child: Text(
            '...',
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
