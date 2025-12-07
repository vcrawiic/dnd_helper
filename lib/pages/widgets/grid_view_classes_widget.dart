import 'package:dnd_helper/cubits/classes_cubit.dart';
import 'package:dnd_helper/cubits/classes_state.dart';
import 'package:dnd_helper/models/classes_info/class.dart';
import 'package:dnd_helper/pages/widgets/class_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridViewClassesWidget extends StatelessWidget {
  const GridViewClassesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassesCubit, ClassesState>(
      builder: (context, state) {
        if (state is ClassesLoading) {
          return Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is ClassesError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(state.message),
            ),
          );
        }
        if (state is ClassesLoaded) {
          final classes = state.classes;
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: GridView.builder(
                itemCount: classes.data?.classes?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final classItem = classes.data?.classes?[index];
                  return ListViewItem(classItem: classItem);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class ListViewItem extends StatelessWidget {
  final Class? classItem;

  const ListViewItem({super.key, required this.classItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.blueAccent.shade100,
        child: Center(child: Text(classItem?.name ?? 'Unknown')),
      ),
      onTap: () {
        final item = classItem;
        if (item != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text(item.name ?? 'Class Details'),
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.transparent,
                ),
                backgroundColor: Colors.white,
                body: ClassInfoWidget(classItem: item),
              ),
            ),
          );
        }
      },
    );
  }
}
