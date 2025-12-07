import 'package:dnd_helper/pages/color_page.dart';
import 'package:dnd_helper/pages/initial/initial_page.dart';
import 'package:dnd_helper/pages/navigation/navigation_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> routeFactory(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const InitialPage());
    case '/navigationPage':
      return MaterialPageRoute(builder: (_) => const NavigationPage());
    case '/colorPage':
      final args = settings.arguments as ColorPageArgs;
      return MaterialPageRoute(
        builder: (_) => ColorPage(baseColor: args.baseColor, level: args.level),
      );
  }
  return MaterialPageRoute(builder: (_) => const Scaffold(body: Text('404')));
}
