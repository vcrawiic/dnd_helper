import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/action_button.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/calculator_input_mixin.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/calculator_keypad.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/xp_progress_bar.dart';
import 'package:flutter/material.dart';

class XpCalculatorContent extends StatefulWidget {
  final int currentLevel;
  final int currentXp;
  final int xpForCurrentLevel;
  final int xpForNextLevel;
  final bool canLevelUp;
  final Function(int) onAddXp;
  final Function(int) onRemoveXp;
  final VoidCallback onLevelUp;

  const XpCalculatorContent({
    super.key,
    required this.currentLevel,
    required this.currentXp,
    required this.xpForCurrentLevel,
    required this.xpForNextLevel,
    required this.canLevelUp,
    required this.onAddXp,
    required this.onRemoveXp,
    required this.onLevelUp,
  });

  @override
  State<XpCalculatorContent> createState() => _XpCalculatorContentState();
}

class _XpCalculatorContentState extends State<XpCalculatorContent>
    with CalculatorInputMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          XpProgressBar(
            currentLevel: widget.currentLevel,
            currentXp: widget.currentXp,
            xpForCurrentLevel: widget.xpForCurrentLevel,
            xpForNextLevel: widget.xpForNextLevel,
          ),
          const SizedBox(height: 24),
          CalculatorKeypad(
            onDigitPressed: onDigitPressed,
            onBackspace: onBackspace,
            inputValue: inputValue,
            rightColumn: Column(
              children: List.generate(
                4,
                (_) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SizedBox(
                    height: 56,
                    width: 56,
                    child: OutlinedButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: Pallete.greyDark),
                      ),
                      child: const SizedBox(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ActionButton(
                  label: 'UPGRADE',
                  color: Pallete.primary,
                  onPressed: widget.canLevelUp ? widget.onLevelUp : null,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ActionButton(
                  label: 'INCREASE',
                  color: Pallete.primary,
                  onPressed: parsedValue != 0
                      ? () {
                          widget.onAddXp(parsedValue.abs());
                          setState(() => inputValue = '');
                        }
                      : null,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ActionButton(
                  label: 'DECREASE',
                  color: Pallete.primary,
                  onPressed: parsedValue != 0
                      ? () {
                          widget.onRemoveXp(parsedValue.abs());
                          setState(() => inputValue = '');
                        }
                      : null,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  debugPrint('Open settings');
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}
