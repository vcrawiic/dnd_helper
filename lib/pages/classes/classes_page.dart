import 'package:dnd_helper/pages/classes/classes_cubit.dart';
import 'package:dnd_helper/models/classes/class_order.dart';
import 'package:dnd_helper/pages/classes/widgets/grid_view_classes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  @override
  void initState() {
    super.initState();
    context.read<ClassesCubit>().fetchClasses(
      ClassOrder(
        orderDirection: ClassOrderDirection.ASC,
        orderBy: ClassOrderBy.NAME,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('D&D Classes'),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: GridViewClassesWidget(),
    );
  }
}
