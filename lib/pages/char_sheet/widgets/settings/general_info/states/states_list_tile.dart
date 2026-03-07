import 'package:flutter/material.dart';

class StatesListTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  const StatesListTile({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: isSelected,
        onChanged: (value) {
          !isSelected;
        },
      ),
    );
  }
}
