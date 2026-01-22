import 'package:flutter/material.dart';

class CharSettings extends StatelessWidget {
  final String title;
  final Widget body;
  const CharSettings({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: body,
      ),
    );
  }
}
