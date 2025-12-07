import 'package:dnd_helper/factories/route_factory.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nested Navigation Demo',
      initialRoute: '/',
      onGenerateRoute: routeFactory,
    );
  }
}
