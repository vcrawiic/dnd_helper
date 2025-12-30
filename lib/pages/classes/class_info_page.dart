import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/classes/class.dart';
import 'package:dnd_helper/pages/classes/widgets/class_info_widget.dart';
import 'package:flutter/material.dart';

class ClassInfoPage extends StatelessWidget {
  final Class classItem;
  const ClassInfoPage({super.key, required this.classItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/dung.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Pallete.primaryWhiteText),
          title: Text(
            classItem.name ?? 'Class Details',
            style: TextStyle(
              color: Pallete.secondaryBG,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: ClassInfoWidget(classItem: classItem),
      ),
    );
  }
}
