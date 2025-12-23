import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/models/classes/class.dart';
import 'package:dnd_helper/pages/classes/widgets/class_info_widget.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final Class? classItem;

  const ListViewItem({super.key, required this.classItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: LiquidContainer(
        radius: 12,
        child: Card(
          color: Pallete.primaryAlpha100,
          child: Center(
            child: Text(
              classItem?.name ?? 'Unknown',
              style: TextStyle(color: Pallete.secondaryBG, fontSize: 21),
            ),
          ),
        ),
      ),
      onTap: () {
        final item = classItem;
        if (item != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/dung.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Scaffold(
                  extendBody: true,
                  appBar: AppBar(
                    title: Text(item.name ?? 'Class Details', style: TextStyle(color: Pallete.secondaryBG, fontSize: 24),),
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                  ),
                  backgroundColor: Colors.transparent,
                  body: ClassInfoWidget(classItem: item),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
