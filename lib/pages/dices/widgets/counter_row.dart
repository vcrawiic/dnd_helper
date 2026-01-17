import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class CounterRow extends StatelessWidget {
  final String label;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final double fontSize;

  const CounterRow({
    super.key,
    required this.label,
    this.onIncrement,
    this.onDecrement,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.remove_circle_outline,
            color: Pallete.primaryWhiteTextAlpha200,
          ),
          onPressed: onDecrement,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Pallete.primaryWhiteText,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add_circle_outline,
            color: Pallete.primaryWhiteTextAlpha200,
          ),
          onPressed: onIncrement,
        ),
      ],
    );
  }
}
