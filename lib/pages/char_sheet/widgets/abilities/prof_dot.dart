import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

/// Точка владения: пусто → владение (заливка) → компетентность (заливка + обводка).
/// Один тап циклит эти состояния.
class ProfDot extends StatelessWidget {
  final bool proficient;
  final bool expertise;
  final VoidCallback? onTap;

  const ProfDot({
    super.key,
    required this.proficient,
    this.expertise = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: proficient ? Pallete.primary : Colors.transparent,
          border: Border.all(
            color: expertise ? Pallete.secondaryWhiteText : Pallete.borderColor,
            width: expertise ? 2.5 : 1.5,
          ),
        ),
      ),
    );
  }
}
