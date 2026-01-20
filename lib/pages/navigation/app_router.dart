import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/models/classes/class.dart';
import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/pages/auth/auth_page.dart';
import 'package:dnd_helper/pages/char_sheet/char_page.dart';
import 'package:dnd_helper/pages/classes/class_info_page.dart';
import 'package:dnd_helper/pages/classes/classes_cubit.dart';
import 'package:dnd_helper/pages/classes/classes_page.dart';
import 'package:dnd_helper/pages/dices/dice_cubit.dart';
import 'package:dnd_helper/pages/dices/dice_page.dart';
import 'package:dnd_helper/pages/monsters/monster_info_page.dart';
import 'package:dnd_helper/pages/monsters/monsters_page.dart';
import 'package:dnd_helper/pages/navigation/main_shell.dart';
import 'package:dnd_helper/pages/navigation/routes.dart';
import 'package:dnd_helper/pages/profile/image_picker/image_cubit.dart';
import 'package:dnd_helper/pages/profile/profile_cubit.dart';
import 'package:dnd_helper/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: rootNavigationKey,
  initialLocation: AppRoutes.classes,
  redirect: (context, state) {
    final isLoggedIn = GlobalDependencies.authService.currentUser != null;
    final isOnAuth = state.matchedLocation == AppRoutes.auth;

    if (!isLoggedIn && !isOnAuth) {
      return AppRoutes.auth;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: AppRoutes.auth,
      builder: (context, state) => const AuthPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.classes,
              builder: (context, state) => BlocProvider(
                create: (_) => ClassesCubit(GlobalDependencies.graphQLService),
                child: const ClassesPage(),
              ),
              routes: [
                GoRoute(
                  path: AppRoutes.classInfo,
                  builder: (context, state) {
                    final classItem = state.extra as Class;
                    return ClassInfoPage(classItem: classItem);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.monsters,
              builder: (context, state) => ProviderScope(
                child: MonstersPage(GlobalDependencies.graphQLService),
              ),
              routes: [
                GoRoute(
                  path: AppRoutes.monsterInfo,
                  builder: (context, state) {
                    final monsterItem = state.extra as Monster;
                    return MonsterInfoPage(monsterItem: monsterItem);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.dices,
              builder: (context, state) => BlocProvider(
                create: (_) => DiceCubit(GlobalDependencies.diceRollerService),
                child: const DicePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => ProfileCubit(GlobalDependencies.authService),
                  ),
                  BlocProvider(
                    create: (_) =>
                        ImageCubit(GlobalDependencies.storageService)
                          ..loadSavedImage(),
                  ),
                ],
                child: const ProfilePage(),
              ),
              routes: [
                GoRoute(
                  path: AppRoutes.charSheet,
                  builder: (context, state) => const CharPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
