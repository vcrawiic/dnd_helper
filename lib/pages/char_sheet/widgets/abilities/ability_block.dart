import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/models/skill_catalog.dart';
import 'package:dnd_helper/pages/char_sheet/providers/char_stats_provider.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/abilities/skill_row.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/abilities/stat_pill.dart';
import 'package:dnd_helper/widgets/liquid_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Блок одной характеристики: значение, модификатор, проверка/спасбросок и
/// список навыков с точками владения.
class AbilityBlock extends ConsumerWidget {
  final String characterId;
  final String abilityKey;

  const AbilityBlock({
    super.key,
    required this.characterId,
    required this.abilityKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(charStatsProvider(characterId)).asData?.value;
    if (stats == null) return const SizedBox.shrink();
    final notifier = ref.read(charStatsProvider(characterId).notifier);
    final skills = skillsForAbility(abilityKey);

    return LiquidContainer(
      radius: 16,
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.greyDarkAlpha100,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    kAbilityLabels[abilityKey]!.toUpperCase(),
                    style: const TextStyle(
                      color: Pallete.primaryWhiteText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${stats.abilityScore(abilityKey)}',
                  style: const TextStyle(
                    color: Pallete.secondaryWhiteText,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: StatPill(
                    label: 'Проверка',
                    target: kAbilityLabels[abilityKey]!,
                    modifier: stats.abilityMod(abilityKey),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: StatPill(
                    label: 'Спасбросок',
                    target: kAbilityLabels[abilityKey]!,
                    modifier: stats.savingThrow(abilityKey),
                    proficient: stats.proficiencies.hasSave(abilityKey),
                    onTapDot: () => notifier.toggleSaveProficiency(abilityKey),
                  ),
                ),
              ],
            ),
            if (skills.isNotEmpty) const SizedBox(height: 10),
            for (final skill in skills)
              SkillRow(
                label: skill.label,
                modifier: stats.skillMod(skill.key),
                proficient: stats.proficiencies.hasSkill(skill.key),
                expertise: stats.proficiencies.hasExpertise(skill.key),
                onTap: () => notifier.cycleSkillProficiency(skill.key),
              ),
          ],
        ),
      ),
    );
  }
}
