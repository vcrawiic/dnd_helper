import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class LiquidContainer extends StatelessWidget {
  final double radius;
  final Widget child;
  const LiquidContainer({
    super.key,
    required this.radius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LiquidGlassLayer(
      child: LiquidGlass.grouped(
        shape: LiquidRoundedRectangle(borderRadius: radius),
        child: child,
      ),
    );
  }
}
