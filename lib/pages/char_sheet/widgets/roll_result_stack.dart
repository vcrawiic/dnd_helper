import 'package:dnd_helper/pages/char_sheet/providers/roll_result_provider.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/roll_result_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Стек карточек последних бросков в углу листа (до 5, новые снизу).
/// Крестик на любой карточке очищает весь список.
class RollResultStack extends ConsumerWidget {
  const RollResultStack({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(rollResultsProvider);
    if (results.isEmpty) return const SizedBox.shrink();

    final clear = ref.read(rollResultsProvider.notifier).clear;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final result in results)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: RollResultCard(result: result, onClose: clear),
          ),
      ],
    );
  }
}
