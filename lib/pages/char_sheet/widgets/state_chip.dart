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
          decoration: BoxDecoration(),
          child: Text(value ?? '')),
        Text(label),
      ],
    );
  }
}
