import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class CalculatorKeypad extends StatelessWidget {
  final Function(String) onDigitPressed;
  final VoidCallback onBackspace;
  final Widget? rightColumn;
  final String inputValue;

  const CalculatorKeypad({
    super.key,
    required this.onDigitPressed,
    required this.onBackspace,
    this.rightColumn,
    required this.inputValue,
  });

  @override
  Widget build(BuildContext context) {
    final column = rightColumn;
    return Column(spacing: 8,
      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  border: Border.all(color: Pallete.greyDark),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(inputValue, style: const TextStyle(fontSize: 24)),
              ),
            ),
            _KeypadButton(
              onPressed: onBackspace,
              child: const Icon(Icons.backspace_outlined),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(spacing: 8,
                children: [
                  _buildDigitRow(['7', '8', '9']),
                  _buildDigitRow(['4', '5', '6']),
                  _buildDigitRow(['1', '2', '3']),
                  _buildDigitRow(['0', '+', '-']),
                ],
              ),
            ),
            if (column != null) ...[column],
          ],
        ),
      ],
    );
  }

  Widget _buildDigitRow(List<String> digits) {
    return Row(
      children: digits
          .map(
            (d) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _KeypadButton(
                  onPressed: () => onDigitPressed(d),
                  child: Text(d, style: const TextStyle(fontSize: 24)),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _KeypadButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const _KeypadButton({required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: BorderSide(color: Pallete.greyDark),
        ),
        child: child,
      ),
    );
  }
}
