import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class ResultCounter extends StatelessWidget {
  final int count;

  const ResultCounter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Found $count monster(s)',
        style: TextStyle(color: Pallete.primaryWhiteText, fontSize: 14),
      ),
    );
  }
}
