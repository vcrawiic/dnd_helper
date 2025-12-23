import 'package:dnd_helper/pages/classes/classes_cubit.dart';
import 'package:dnd_helper/pages/classes/classes_state.dart';
import 'package:dnd_helper/pages/classes/widgets/list_view_item.dart';
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
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 120),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: classes.data?.classes?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final classItem = classes.data?.classes?[index];
                  return ListViewItem(classItem: classItem);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 9,
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
