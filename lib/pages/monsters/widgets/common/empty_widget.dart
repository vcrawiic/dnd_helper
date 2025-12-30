import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String message;

  const EmptyWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 16, color: Pallete.primaryWhiteText),
      ),
    );
  }
}
