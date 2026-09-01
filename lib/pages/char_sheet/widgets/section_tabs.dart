import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/models/sheet_section.dart';
import 'package:flutter/material.dart';

/// Горизонтальные табы правой панели (десктоп): переключают секции из [sections].
class SectionTabs extends StatelessWidget {
  final List<SheetSection> sections;
  final SheetSection current;
  final ValueChanged<SheetSection> onChanged;

  const SectionTabs({
    super.key,
    required this.sections,
    required this.current,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final section in sections)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => onChanged(section),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: section == current
                        ? Pallete.primaryAlpha100
                        : Colors.transparent,
                    border: Border.all(
                      color: section == current
                          ? Pallete.primary
                          : Pallete.borderColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    section.label,
                    style: TextStyle(
                      color: section == current
                          ? Pallete.secondaryWhiteText
                          : Pallete.primaryWhiteText,
                      fontWeight: section == current
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
