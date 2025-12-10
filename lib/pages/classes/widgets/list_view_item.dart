import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/classes/class.dart';
import 'package:dnd_helper/pages/classes/widgets/class_info_widget.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final Class? classItem;

  const ListViewItem({super.key, required this.classItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Pallete.primary,
        child: Center(
          child: Text(
            classItem?.name ?? 'Unknown',
            style: TextStyle(color: Pallete.secondaryBG),
          ),
        ),
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
                  backgroundColor: Pallete.primaryBG,
                  surfaceTintColor: Colors.transparent,
                ),
                backgroundColor: Pallete.primaryBG,
                body: ClassInfoWidget(classItem: item),
              ),
            ),
          );
        }
      },
    );
  }
}
