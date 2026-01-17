import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/dices/dice_cubit.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDiceDialog extends StatefulWidget {
  const CustomDiceDialog({super.key});

  @override
  State<CustomDiceDialog> createState() => _CustomDiceDialogState();
}

class _CustomDiceDialogState extends State<CustomDiceDialog> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Pallete.transparent,
      child: LiquidContainer(
        radius: 12,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Pallete.primaryBGAlpha100,
          ),
          padding: const EdgeInsets.all(24),
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Custom Dice',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Pallete.primaryWhiteText,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Input sides count:',
                style: TextStyle(color: Pallete.primaryWhiteText),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                cursorColor: Pallete.primaryWhiteTextAlpha200,
                cursorHeight: 14,
                style: const TextStyle(color: Pallete.primaryWhiteText),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 12),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Pallete.primaryWhiteTextAlpha200), borderRadius: BorderRadius.circular(8)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Pallete.primaryWhiteText), borderRadius: BorderRadius.circular(8)),
                  hintStyle: TextStyle(color: Pallete.primaryWhiteTextAlpha200),
                  hintText: 'from 2 to 1000',
                  prefixText: 'd',
                  prefixStyle: const TextStyle(color: Pallete.primaryWhiteText),
                  errorText: _error,
                ),
                onChanged: (_) => setState(() => _error = null),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Pallete.primary, fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: _apply,
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                        color: Pallete.primaryWhiteText,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _apply() {
    final sides = int.tryParse(_controller.text);

    if (sides == null) {
      setState(() => _error = 'Input integer');
      return;
    }

    if (sides < 2 || sides > 1000) {
      setState(() => _error = 'From 2 to 1000');
      return;
    }

    context.read<DiceCubit>().setCustomDice(sides);
    Navigator.pop(context);
  }
}
