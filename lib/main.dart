import 'package:dnd_helper/cubits/classes_cubit.dart';
import 'package:dnd_helper/factories/route_factory.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) =>
          ClassesCubit(GraphQLService('https://www.dnd5eapi.co/graphql/2014')),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nested Navigation Demo',
      initialRoute: '/',
      onGenerateRoute: routeFactory,
    );
  }
}
