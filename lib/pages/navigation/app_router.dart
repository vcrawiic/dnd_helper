import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/models/classes/class.dart';
import 'package:dnd_helper/models/monsters/monster.dart';
import 'package:dnd_helper/pages/auth/auth_page.dart';
import 'package:dnd_helper/pages/char_sheet/char_page.dart';
import 'package:dnd_helper/pages/char_sheet/providers/char_stats_provider.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/xp_calculator_content.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/general_info/char_settings.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/general_info/general_info_settings.dart';
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
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const AuthPage(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
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
                  pageBuilder: (context, state) {
                    final classItem = state.extra as Class;
                    return CustomTransitionPage(
                      child: ClassInfoPage(classItem: classItem),
                      transitionDuration: const Duration(milliseconds: 300),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                    );
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
              builder: (context, state) =>
                  MonstersPage(GlobalDependencies.graphQLService),
              routes: [
                GoRoute(
                  path: AppRoutes.monsterInfo,
                  pageBuilder: (context, state) {
                    final monsterItem = state.extra as Monster;
                    return CustomTransitionPage(
                      child: MonsterInfoPage(monsterItem: monsterItem),
                      transitionDuration: const Duration(milliseconds: 300),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                    );
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
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      child: const CharPage(),
                      transitionDuration: const Duration(milliseconds: 300),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                    );
                  },
                  routes: [
                    GoRoute(
                      path: AppRoutes.xpCalculator,
                      pageBuilder: (context, state) {
                        final characterId = GlobalDependencies
                                .authService.currentUser?.uid ??
                            '';
                        return CustomTransitionPage(
                          child: CharSettings(
                            title: 'XP Calculator',
                            body: Consumer(
                              builder: (context, ref, _) {
                                final statsAsync =
                                    ref.watch(charStatsProvider(characterId));

                                return statsAsync.when(
                                  loading: () => const Center(
                                      child: CircularProgressIndicator()),
                                  error: (e, _) =>
                                      Center(child: Text('Error: $e')),
                                  data: (stats) {
                                    final notifier = ref.read(
                                        charStatsProvider(characterId)
                                            .notifier);

                                    return XpCalculatorContent(
                                      currentLevel: stats.level,
                                      currentXp: stats.currentXp,
                                      xpForCurrentLevel:
                                          stats.xpForCurrentLevel,
                                      xpForNextLevel: stats.xpForNextLevel,
                                      canLevelUp: stats.canLevelUp,
                                      onAddXp: notifier.addXp,
                                      onRemoveXp: (value) =>
                                          notifier.addXp(-value),
                                      onLevelUp: notifier.levelUp,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        );
                      },
                    ),
                    GoRoute(
                      path: AppRoutes.generalSettings,
                      pageBuilder: (context, state) {
                        final characterId = GlobalDependencies
                                .authService.currentUser?.uid ??
                            '';
                        return CustomTransitionPage(
                          child: CharSettings(
                            title: 'General Info',
                            body: GeneralInfoSettings(characterId: characterId),
                          ),
                          transitionDuration: const Duration(milliseconds: 300),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
