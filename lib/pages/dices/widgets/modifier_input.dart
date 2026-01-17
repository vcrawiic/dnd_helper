import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/dices/dice_cubit.dart';
import 'package:dnd_helper/pages/dices/dice_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModifierInput extends StatefulWidget {
  const ModifierInput({super.key});

  @override
  State<ModifierInput> createState() => _ModifierInputState();
}

class _ModifierInputState extends State<ModifierInput> {
  bool _isEditing = false;
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus && _isEditing) {
      _applyValue();
    }
  }

  void _startEditing(int currentModifier) {
    setState(() {
      _isEditing = true;
      _controller.text = currentModifier != 0 ? currentModifier.toString() : '';
    });
    Future.microtask(() {
      _focusNode.requestFocus();
      _controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _controller.text.length,
      );
    });
  }

  void _applyValue() {
    final modifier = int.tryParse(_controller.text) ?? 0;
    context.read<DiceCubit>().setModifier(modifier);
    setState(() => _isEditing = false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiceCubit, DiceState>(
      buildWhen: (prev, curr) => prev.modifier != curr.modifier,
      builder: (context, state) {
        final cubit = context.read<DiceCubit>();
        final modText = state.modifier >= 0
            ? '+${state.modifier}'
            : '${state.modifier}';

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove, color: Pallete.primaryWhiteText,),
              onPressed: () => cubit.setModifier(state.modifier - 1),
            ),
            GestureDetector(
              onTap: () => _startEditing(state.modifier),
              child: Container(
                width: 60,
                height: 40,
                alignment: Alignment.center,
                child: _isEditing
                    ? TextField(
                        cursorColor: Pallete.primaryWhiteText,
                        cursorHeight: 20,
                        controller: _controller,
                        focusNode: _focusNode,
                        keyboardType: const TextInputType.numberWithOptions(signed: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')),
                        ],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Pallete.primaryWhiteText
                        ),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (_) => _applyValue(),
                      )
                    : Text(
                        modText,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: state.modifier == 0
                              ? Pallete.primaryWhiteText
                              : (state.modifier > 0 ? Colors.green : Pallete.primary),
                        ),
                      ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Pallete.primaryWhiteText,),
              onPressed: () => cubit.setModifier(state.modifier + 1),
            ),
          ],
        );
      },
    );
  }
}
