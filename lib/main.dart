import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/pages/auth/auth_cubit.dart';
import 'package:dnd_helper/pages/auth/auth_state.dart';
import 'package:dnd_helper/pages/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(GlobalDependencies.authService),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            appRouter.go('/classes');
          } else if (state is Unauthenticated) {
            appRouter.go('/auth');
          }
        },
        child: MaterialApp.router(
          theme: ThemeData(fontFamily: 'Jersey'),
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
