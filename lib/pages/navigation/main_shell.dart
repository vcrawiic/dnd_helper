import 'package:dnd_helper/DS/dung_icons.dart';
import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/widgets/custom_nav_bar.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.transparent,
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: LiquidContainer(
            radius: 20,
            child: CustomNavBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
              items: const [
                CustomNavBarItem(icon: DungIcons.helm, label: 'Classes'),
                CustomNavBarItem(icon: DungIcons.fangs, label: 'Monsters'),
                CustomNavBarItem(icon: DungIcons.fire, label: 'Dices'),
                CustomNavBarItem(icon: DungIcons.character, label: 'Profile'),
              ],
              selectedColor: Pallete.primary,
              unselectedColor: Pallete.primaryBG,
              backgroundColor: Pallete.greyDarkAlpha100,
              selectedBackgroundColor: Pallete.greyDarkAlpha100,
            ),
          ),
        ),
      ),
    );
  }
}
