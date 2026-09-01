import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Портрет персонажа с контекст-меню (Настройки / Сменить портрет / Поделиться /
/// Комната / Гримуар). Пока реализованы только «Настройки».
class PortraitMenu extends StatelessWidget {
  /// Базовый путь листа: `/characters/char_sheet/:id`.
  final String base;

  const PortraitMenu({super.key, required this.base});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: 'Меню персонажа',
      color: Pallete.greyDark.withValues(alpha: 0.98),
      onSelected: (value) {
        if (value == 'settings') {
          context.push('$base/${AppRoutes.generalSettings}');
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('В разработке')));
        }
      },
      itemBuilder: (_) => const [
        PopupMenuItem(value: 'settings', child: Text('Настройки')),
        PopupMenuItem(value: 'portrait', child: Text('Сменить портрет')),
        PopupMenuItem(value: 'share', child: Text('Поделиться')),
        PopupMenuItem(value: 'room', child: Text('Комната')),
        PopupMenuItem(value: 'grimoire', child: Text('Гримуар')),
      ],
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Pallete.greyDarkAlpha200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Pallete.borderColor, width: 1.5),
        ),
        child: const Icon(Icons.person, color: Pallete.primaryWhiteText),
      ),
    );
  }
}
