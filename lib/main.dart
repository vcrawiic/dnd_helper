import 'package:dnd_helper/DI/global_dependencies.dart';
import 'package:dnd_helper/factories/route_factory.dart';
import 'package:dnd_helper/pages/auth/auth_cubit.dart';
import 'package:dnd_helper/pages/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(GlobalDependencies.authService),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            navigatorKey.currentState?.pushNamedAndRemoveUntil('/', (route) => false);
          } else if (state is Unauthenticated) {
            navigatorKey.currentState?.pushNamedAndRemoveUntil('/', (route) => false);
          }
        },
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: routeFactory
        ),
      ),
    );
  }
}
