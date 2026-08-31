import 'package:flutter/material.dart';

/// Ограничивает ширину контента и центрирует его по горизонтали, чтобы на
/// широких экранах (десктоп/веб) страницы не растягивались во всю ширину.
/// Фон при этом остаётся полноэкранным — оборачивать нужно только контент.
class MaxWidthContent extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const MaxWidthContent({super.key, required this.child, this.maxWidth = 800});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
