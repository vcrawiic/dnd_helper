import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/models/char_stats_model.dart';
import 'package:dnd_helper/pages/char_sheet/models/skill_catalog.dart';
import 'package:dnd_helper/pages/char_sheet/providers/char_stats_provider.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/header/hp_tile.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/header/portrait_menu.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/header/stat_tile.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/xp_progress_bar.dart';
import 'package:dnd_helper/pages/navigation/routes.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Шапка листа: портрет с меню, имя/раса/класс, полоса уровня (→ калькулятор
/// экспы), AC/скорость/мастерство/HP (→ калькулятор HP), инициатива и состояния.
class GeneralInfo extends ConsumerWidget {
  final String characterId;

  const GeneralInfo({super.key, required this.characterId});

  String get _base =>
      '${AppRoutes.characters}/${AppRoutes.charSheet}/$characterId';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(charStatsProvider(characterId));
    return statsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
      data: (stats) => _content(context, ref, stats),
    );
  }

  Widget _content(BuildContext context, WidgetRef ref, CharStats stats) {
    final notifier = ref.read(charStatsProvider(characterId).notifier);

    return LiquidContainer(
      radius: 20,
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.greyDarkAlpha100,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PortraitMenu(base: _base),
                const SizedBox(width: 12),
                Expanded(child: _identity(context, stats)),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                StatTile(
                  label: 'КЛАСС БРОНИ',
                  value: '${stats.combat.totalAC}',
                  onTap: () =>
                      notifier.updateCombat(hasShield: !stats.combat.hasShield),
                  highlighted: stats.combat.hasShield,
                ),
                StatTile(label: 'СКОРОСТЬ', value: '${stats.speed}'),
                StatTile(
                  label: 'МАСТЕРСТВО',
                  value: fmtMod(stats.proficiencyBonus),
                ),
                StatTile(label: 'ИНИЦИАТИВА', value: fmtMod(stats.initiative)),
                StatTile(
                  label: 'ВДОХНОВЕНИЕ',
                  value: '${stats.inspiration}',
                  onTap: () => notifier.updateConditions(
                    inspiration: stats.inspiration > 0 ? 0 : 1,
                  ),
                  highlighted: stats.inspiration > 0,
                ),
                StatTile(label: 'СОСТОЯНИЯ', value: '${stats.states.length}'),
                HpTile(
                  stats: stats,
                  onTap: () => context.push('$_base/${AppRoutes.hpCalculator}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _identity(BuildContext context, CharStats stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stats.name.isEmpty ? 'Без имени' : stats.name,
          style: const TextStyle(
            color: Pallete.secondaryWhiteText,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          _raceClassLine(stats),
          style: TextStyle(
            color: Pallete.primaryWhiteTextAlpha200,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => context.push('$_base/${AppRoutes.xpCalculator}'),
          child: XpProgressBar(
            currentLevel: stats.level,
            currentXp: stats.currentXp,
            xpForCurrentLevel: stats.xpForCurrentLevel,
            xpForNextLevel: stats.xpForNextLevel,
          ),
        ),
      ],
    );
  }

  String _raceClassLine(CharStats s) {
    final race = s.race.isEmpty ? '—' : s.race;
    final cls = s.characterClass.isEmpty ? '—' : s.characterClass;
    final arch = s.archetype.isEmpty ? '' : ' (${s.archetype})';
    return '$race$arch — $cls';
  }
}
