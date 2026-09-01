import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/models/sheet_section.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';

/// Переключатель секций листа для мобильной раскладки: показывает текущую
/// секцию и открывает выбор остальных.
class SectionSwitcher extends StatelessWidget {
  final SheetSection current;
  final ValueChanged<SheetSection> onChanged;

  const SectionSwitcher({
    super.key,
    required this.current,
    required this.onChanged,
  });

  Future<void> _pick(BuildContext context) async {
    final selected = await showModalBottomSheet<SheetSection>(
      context: context,
      backgroundColor: Pallete.greyDark.withValues(alpha: 0.98),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final section in SheetSection.values)
              ListTile(
                title: Text(
                  section.label,
                  style: TextStyle(
                    color: section == current
                        ? Pallete.primary
                        : Pallete.primaryWhiteText,
                    fontWeight: section == current
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () => Navigator.pop(context, section),
              ),
          ],
        ),
      ),
    );
    if (selected != null) onChanged(selected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pick(context),
      behavior: HitTestBehavior.opaque,
      child: LiquidContainer(
        radius: 12,
        child: Container(
          decoration: BoxDecoration(
            color: Pallete.greyDarkAlpha100,
            border: Border.all(color: Pallete.borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  current.label,
                  style: const TextStyle(
                    color: Pallete.primaryWhiteText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.expand_more, color: Pallete.primaryWhiteText),
            ],
          ),
        ),
      ),
    );
  }
}
