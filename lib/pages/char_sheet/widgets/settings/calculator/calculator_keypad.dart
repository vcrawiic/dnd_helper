import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class CalculatorKeypad extends StatelessWidget {
  final Function(String) onDigitPressed;
  final VoidCallback onBackspace;

  final String inputValue;
  final int? computedResult;

  final Widget rightColumn;

  const CalculatorKeypad({
    super.key,
    required this.onDigitPressed,
    required this.onBackspace,
    required this.inputValue,
    required this.rightColumn,
    this.computedResult,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDisplay(),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildDigitGrid()),
            const SizedBox(width: 8),
            rightColumn,
          ],
        ),
      ],
    );
  }

  Widget _buildDisplay() {
    final hasExpression =
        inputValue.contains('+') ||
        (inputValue.contains('-') && inputValue.indexOf('-') > 0);

    return Row(
      spacing: 4,
      children: [
        Expanded(
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              border: Border.all(color: Pallete.greyDark),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  inputValue.isEmpty ? '0' : inputValue,
                  style: const TextStyle(fontSize: 24),
                ),
                if (hasExpression && computedResult != null)
                  Text(
                    '= $computedResult',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
              ],
            ),
          ),
        ),

        _KeypadButton(
          onPressed: onBackspace,
          child: const Icon(Icons.backspace_outlined),
        ),
      ],
    );
  }

  Widget _buildDigitGrid() {
    return Column(
      spacing: 8,
      children: [
        _buildDigitRow(['7', '8', '9']),
        _buildDigitRow(['4', '5', '6']),
        _buildDigitRow(['1', '2', '3']),
        _buildDigitRow(['0', '+', '-']),
      ],
    );
  }

  Widget _buildDigitRow(List<String> digits) {
    return Row(
      spacing: 4,
      children: digits.map((digit) {
        return Expanded(
          child: _KeypadButton(
            onPressed: () => onDigitPressed(digit),
            child: Text(digit, style: const TextStyle(fontSize: 24)),
          ),
        );
      }).toList(),
    );
  }
}

class _KeypadButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const _KeypadButton({required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(
            color: onPressed != null
                ? Pallete.greyDarkAlpha200
                : Pallete.greyDark,
          ),
        ),
        child: child,
      ),
    );
  }
}

class EmptyRightColumn extends StatelessWidget {
  const EmptyRightColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index < 3 ? 8 : 0),
          child: SizedBox(
            height: 56,
            width: 56,
            child: OutlinedButton(
              onPressed: null,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(color: Pallete.greyLight),
              ),
              child: const SizedBox(),
            ),
          ),
        );
      }),
    );
  }
}
