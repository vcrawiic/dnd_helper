import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.child,
    this.width,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(8.0),
  });

  final Widget child;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return LiquidContainer(
      radius: 8,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor ?? Pallete.greyDarkAlpha100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
