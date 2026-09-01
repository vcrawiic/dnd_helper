import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

/// Заглушка ещё не наполненной секции листа.
class SectionPlaceholder extends StatelessWidget {
  final String label;

  const SectionPlaceholder({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Text(
        '«$label» — в разработке',
        style: TextStyle(color: Pallete.primaryWhiteTextAlpha200, fontSize: 16),
      ),
    );
  }
}
