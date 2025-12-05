import 'package:dnd_helper/pages/classes_page.dart';
import 'package:dnd_helper/pages/color_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int index = 0;

  final List<Color> baseColors = [Colors.red, Colors.green, Colors.blue, Colors.orange];

  final List<GlobalKey<NavigatorState>> navKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  Widget _buildStack(int i) {
    return Navigator(
      key: navKeys[i],
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (_) => i == 0 ? const ClassesPage() : ColorPage(baseColor: baseColors[i], level: 1),
          );
        }

        if (settings.name == '/colorPage') {
          final args = settings.arguments as ColorPageArgs;
          return MaterialPageRoute(
            builder: (_) => ColorPage(baseColor: args.baseColor, level: args.level),
          );
        }

        return MaterialPageRoute(builder: (_) => const Scaffold(body: Text('404')));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final navigator = navKeys[index].currentState;
        if (navigator != null && navigator.canPop()) {
          navigator.pop();
        } else {
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: index,
          children: List.generate(baseColors.length, _buildStack),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) {
            if (i == index) {
              navKeys[i].currentState?.popUntil((route) => route.isFirst);
            } else {
              setState(() => index = i);
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: 'Red'),
            BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: 'Green'),
            BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: 'Blue'),
            BottomNavigationBarItem(icon: Icon(Icons.looks_4), label: 'Orange'),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}