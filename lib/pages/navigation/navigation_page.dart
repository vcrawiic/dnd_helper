import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/DS/dung_icons.dart';
import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/classes/classes_cubit.dart';
import 'package:dnd_helper/pages/classes/classes_page.dart';
import 'package:dnd_helper/pages/color_page.dart';
import 'package:dnd_helper/pages/monsters/monsters_page.dart';
import 'package:dnd_helper/pages/profile/image_picker/image_cubit.dart';
import 'package:dnd_helper/pages/profile/profile_cubit.dart';
import 'package:dnd_helper/pages/profile/profile_page.dart';
import 'package:dnd_helper/services/auth/auth_service.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:dnd_helper/services/storage_service/storage_service.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:dnd_helper/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int index = 0;

  late final ClassesCubit _classesCubit;
  late final ProfileCubit _profileCubit;
  late final ImageCubit _imageCubit;

  final List<GlobalKey<NavigatorState>> navKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final GraphQLService _gqlService = GlobalDependencies.graphQLService;
  final AuthService _authService = GlobalDependencies.authService;
  final StorageService _storageService = GlobalDependencies.storageService;

  @override
  void initState() {
    super.initState();
    _classesCubit = ClassesCubit(_gqlService);
    _profileCubit = ProfileCubit(_authService);
    _imageCubit = ImageCubit(_storageService)..loadSavedImage();
  }

  @override
  void dispose() {
    _classesCubit.close();
    _profileCubit.close();
    _imageCubit.close();
    super.dispose();
  }

  Widget _buildStack(int i) {
    return Navigator(
      key: navKeys[i],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => switch (i) {
            // cubit realization
            0 => BlocProvider.value(value: _classesCubit, child: ClassesPage()),
            // riverpod realization
            1 => ProviderScope(child: MonstersPage(_gqlService)),
            2 => ColorPage(baseColor: Pallete.primary, level: 1),
            // profile page
            3 => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: _profileCubit),
                BlocProvider.value(value: _imageCubit),
              ],
              child: ProfilePage(),
            ),
            _ => ColorPage(baseColor: Pallete.primary, level: 1),
          },
        );
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
        backgroundColor: Pallete.primaryBG,
        extendBody: true,
        body: IndexedStack(
          index: index,
          children: List.generate(navKeys.length, _buildStack),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: LiquidContainer(
              radius: 20,
              child: CustomNavBar(
                currentIndex: index,
                onTap: (i) {
                  if (i == index) {
                    navKeys[i].currentState?.popUntil((route) => route.isFirst);
                  } else {
                    setState(() => index = i);
                  }
                },
                items: const [
                  CustomNavBarItem(icon: DungIcons.twenty, label: 'Classes'),
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
      ),
    );
  }
}
