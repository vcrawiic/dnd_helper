import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/providers/char_stats_provider.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/xp_progress_bar.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/state_chip.dart';
import 'package:dnd_helper/pages/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GeneralInfo extends ConsumerWidget {
  final String characterId;

  const GeneralInfo({super.key, required this.characterId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(charStatsProvider(characterId));

    return statsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
      data: (stats) => _buildContent(context, stats, ref),
    );
  }

  Widget _buildContent(BuildContext context, stats, WidgetRef ref) {
    Color hpBorderColor() {
      if (stats.currentHp <= 0) return Pallete.primary;
      if (stats.currentHp <= stats.maxHp ~/ 2) return Pallete.hpBloodied;
      return Pallete.hpHealthy;
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => context.push(
                    '${AppRoutes.profile}/${AppRoutes.charSheet}/${AppRoutes.generalSettings}',
                  ),
                  icon: const Icon(Icons.person_pin_sharp),
                ),
                GestureDetector(
                  onTap: () => context.push(
                    '${AppRoutes.profile}/${AppRoutes.charSheet}/${AppRoutes.generalSettings}',
                  ),
                  child: Column(
                    children: [
                      Text(stats.name.isEmpty ? 'No name' : stats.name),
                      Text('${stats.race} - ${stats.characterClass}'),
                    ],
                  ),
                ),
                const Placeholder(fallbackHeight: 40, fallbackWidth: 40),
              ],
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => context.push(
                '${AppRoutes.profile}/${AppRoutes.charSheet}/${AppRoutes.xpCalculator}',
              ),
              child: XpProgressBar(
                currentLevel: stats.level,
                currentXp: stats.currentXp,
                xpForCurrentLevel: stats.xpForCurrentLevel,
                xpForNextLevel: stats.xpForNextLevel,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(charStatsProvider(characterId).notifier)
                            .updateCombat(hasShield: !stats.combat.hasShield);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/Shield.png',
                            height: 50,
                            width: 50,
                            color: stats.combat.hasShield
                                ? Pallete.primary
                                : Pallete.greyDark,
                          ),
                          Text('${stats.combat.totalAC}'),
                        ],
                      ),
                    ),
                    Column(
                      children: [Text('${stats.speed}'), const Text('Speed')],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mode_night_outlined),
                    ),
                    GestureDetector(
                      onTap: () => context.push(
                        '${AppRoutes.profile}/${AppRoutes.charSheet}/${AppRoutes.hpCalculator}',
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: hpBorderColor()),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              const Icon(Icons.trending_down_outlined),
                              Text('${stats.currentHp}/${stats.maxHp}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: StateChip(
                    label: 'Inspiration',
                    value: '${stats.inspiration}',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: StateChip(
                    label: 'States',
                    value: '${stats.states.length}',
                  ),
                ),
                const SizedBox(width: 8),
                PopupMenuButton<int>(
                  onSelected: (value) {
                    ref
                        .read(charStatsProvider(characterId).notifier)
                        .updateConditions(exhaustion: value);
                  },
                  itemBuilder: (_) => List.generate(
                    7,
                    (i) => PopupMenuItem(value: i, child: Text('$i')),
                  ),
                  child: StateChip(
                    label: 'Exhaustion',
                    value: stats.exhaustion > 0 ? '${stats.exhaustion}' : '',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: StateChip(
                    label: 'Initiative',
                    value: stats.initiative != 0 ? '${stats.initiative}' : '',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
