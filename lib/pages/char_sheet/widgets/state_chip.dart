import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class StateChip extends StatelessWidget {
  final String label;
  final String? value;

  const StateChip({super.key, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Pallete.primary),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text(value ?? '')),
        ),
        Text(label),
      ],
    );
  }
}
