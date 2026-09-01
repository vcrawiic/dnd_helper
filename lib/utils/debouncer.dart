import 'dart:async';
import 'dart:ui';

/// Откладывает выполнение действия: каждый новый [run] отменяет предыдущий
/// запланированный вызов и стартует таймер заново. Серия быстрых изменений
/// (тапы степпера, набор текста) схлопывается в один вызов после паузы —
/// чтобы не отправлять на бэк каждый промежуточный шаг.
class Debouncer {
  Debouncer(this.delay);

  final Duration delay;
  Timer? _timer;
  VoidCallback? _pending;

  void run(VoidCallback action) {
    _pending = action;
    _timer?.cancel();
    _timer = Timer(delay, () {
      _pending = null;
      action();
    });
  }

  /// Немедленно выполнить отложенное действие (если оно есть) и снять таймер.
  /// Вызывается при уходе с экрана, чтобы несохранённые правки долетели.
  void flush() {
    if ((_timer?.isActive ?? false) && _pending != null) {
      _timer!.cancel();
      final action = _pending;
      _pending = null;
      action?.call();
    }
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
    _pending = null;
  }
}
