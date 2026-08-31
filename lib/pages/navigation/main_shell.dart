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
          // На широких экранах (десктоп/веб) навбар не растягивается на всю
          // ширину, а центрируется с ограничением по максимальной ширине.
          // heightFactor: 1 — чтобы обёртка сжималась по высоте до размера бара
          // (иначе Align тянется на всю высоту слота и бар уезжает в центр).
          child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 1,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
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
                    CustomNavBarItem(icon: DungIcons.helm, label: 'Справочник'),
                    CustomNavBarItem(icon: DungIcons.fangs, label: 'Тейблтоп'),
                    CustomNavBarItem(icon: DungIcons.twenty, label: 'Кубы'),
                    CustomNavBarItem(icon: DungIcons.character, label: 'Листы'),
                    CustomNavBarItem(icon: DungIcons.fire, label: 'Профиль'),
                  ],
                  selectedColor: Pallete.primary,
                  unselectedColor: Pallete.primaryBG,
                  backgroundColor: Pallete.greyDarkAlpha100,
                  selectedBackgroundColor: Pallete.greyDarkAlpha100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
