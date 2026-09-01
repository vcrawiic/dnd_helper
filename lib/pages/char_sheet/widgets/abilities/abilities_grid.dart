import 'package:dnd_helper/pages/char_sheet/models/skill_catalog.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/abilities/ability_block.dart';
import 'package:flutter/material.dart';

/// Раскладывает 6 блоков характеристик по колонкам в зависимости от ширины
/// (1 колонка на узком экране, 2–3 на широком), распределяя блоки по кругу.
class AbilitiesGrid extends StatelessWidget {
  final String characterId;

  const AbilitiesGrid({super.key, required this.characterId});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = (constraints.maxWidth ~/ 300).clamp(1, 3);
        final buckets = List.generate(columns, (_) => <Widget>[]);

        for (var i = 0; i < kAbilityKeys.length; i++) {
          buckets[i % columns].add(
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AbilityBlock(
                characterId: characterId,
                abilityKey: kAbilityKeys[i],
              ),
            ),
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var c = 0; c < columns; c++) ...[
              if (c > 0) const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buckets[c],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
