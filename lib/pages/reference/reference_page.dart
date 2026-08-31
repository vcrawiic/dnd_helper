import 'package:dnd_helper/DS/dung_icons.dart';
import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/navigation/routes.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Справочник — единая точка входа в справочные разделы (классы, монстры).
/// Пока данные тянутся из публичного GraphQL; со временем разделы переедут
/// на собственный /api/reference и станут «подсказками» внутри инструментов.
class ReferencePage extends StatelessWidget {
  const ReferencePage({super.key});

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
        backgroundColor: Pallete.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Pallete.transparent,
          title: const Text(
            'Справочник',
            style: TextStyle(color: Pallete.secondaryBG, fontSize: 24),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: _ReferenceCard(
                    icon: DungIcons.helm,
                    label: 'Классы',
                    onTap: () => context.push(
                      '${AppRoutes.reference}/${AppRoutes.classes}',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _ReferenceCard(
                    icon: DungIcons.fangs,
                    label: 'Монстры',
                    onTap: () => context.push(
                      '${AppRoutes.reference}/${AppRoutes.monsters}',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ReferenceCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ReferenceCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: LiquidContainer(
        radius: 20,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Pallete.greyDark.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Pallete.primary, size: 56),
              const SizedBox(height: 12),
              Text(
                label,
                style: const TextStyle(
                  color: Pallete.primaryWhiteText,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
