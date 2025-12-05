import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Initial Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/navigationPage'),
          child: const Text('Go to Navigation Page'),
        ),
      ),
    );
  }
}
