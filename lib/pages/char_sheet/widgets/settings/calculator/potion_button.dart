import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class PotionButton extends StatelessWidget {
  final int diceCount;
  final int modifier;
  final Function(int) onHeal;
  final String label;

  const PotionButton({
    super.key,
    required this.diceCount,
    required this.modifier,
    required this.onHeal,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: OutlinedButton(
        onPressed: () => _rollPotion(context),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(color: Pallete.greyDarkAlpha200),
        ),
        child: Text('${diceCount}d4'),
      ),
    );
  }

  void _rollPotion(BuildContext context) {
    final result = GlobalDependencies.diceRollerService.rollDice(
      sides: 4,
      count: diceCount,
      modifier: modifier,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Potion: ${result.total} HP (${result.rolls.join(" + ")} + $modifier)',
        ),
      ),
    );
    onHeal(result.total);
  }
}
