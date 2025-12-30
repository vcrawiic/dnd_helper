import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class LoadMoreIndicator extends StatelessWidget {
  final bool isLoading;

  const LoadMoreIndicator({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: isLoading
            ? const CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(Pallete.primaryWhiteText),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
