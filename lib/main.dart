import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/pages/auth/auth_cubit.dart';
import 'package:dnd_helper/pages/auth/auth_state.dart';
import 'package:dnd_helper/pages/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
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
            appRouter.go('/reference');
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
