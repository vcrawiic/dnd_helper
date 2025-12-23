import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  final String error;

  const ErrorStateWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text('Error loading monsters: $error'),
      ),
    );
  }
}
