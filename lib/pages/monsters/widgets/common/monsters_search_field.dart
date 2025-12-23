import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';

class MonstersSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String searchQuery;
  final VoidCallback onClear;
  final ValueChanged<String> onChanged;

  const MonstersSearchField({
    super.key,
    required this.controller,
    required this.searchQuery,
    required this.onClear,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: LiquidContainer(
        radius: 16,
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Pallete.primaryBG, fontSize: 18),
          decoration: InputDecoration(
            hintText: 'Search monsters...', hintStyle: TextStyle(color: Pallete.primaryBG, fontSize: 18),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            suffixIcon: searchQuery.isNotEmpty
                ? IconButton(icon: const Icon(Icons.clear, size: 18, color: Pallete.primaryBG), onPressed: onClear)
                : const Icon(Icons.search, size: 18, color: Pallete.primaryBG),
          ),
          
          onChanged: onChanged,
        ),
      ),
    );
  }
}
