import 'package:dnd_helper/pages/char_sheet/models/roll_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Последние броски в листе (до 5). Карточки в углу читают список, кнопки-
/// модификаторы добавляют. Крестик на любой карточке чистит весь список.
/// Пока бросок только локальный; позже сюда же добавим отправку в комнату.
class RollResultsNotifier extends Notifier<List<RollResult>> {
  static const int _max = 5;

  @override
  List<RollResult> build() => const [];

  void add(RollResult result) {
    final next = [...state, result];
    state = next.length > _max ? next.sublist(next.length - _max) : next;
  }

  void clear() => state = const [];
}

final rollResultsProvider =
    NotifierProvider<RollResultsNotifier, List<RollResult>>(
      RollResultsNotifier.new,
    );
