import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/models/char_stats_model.dart';
import 'package:dnd_helper/pages/char_sheet/providers/char_stats_provider.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/action_button.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/calculator_input_mixin.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/calculator_keypad.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/hit_dice_selector.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/hp_display.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/potion_button.dart';
import 'package:dnd_helper/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HPCalculatorContent extends ConsumerStatefulWidget {
  final String characterId;

  const HPCalculatorContent({super.key, required this.characterId});

  @override
  ConsumerState<HPCalculatorContent> createState() =>
      _HPCalculatorContentState();
}

class _HPCalculatorContentState extends ConsumerState<HPCalculatorContent>
    with CalculatorInputMixin {
  bool showSettings = false;
  final TextEditingController maxHpController = TextEditingController();
  final TextEditingController maxBonusHpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final statsAsync = ref.watch(charStatsProvider(widget.characterId));

    return statsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (stats) => _buildContent(stats),
    );
  }

  Widget _buildContent(CharStats stats) {
    final notifier = ref.read(charStatsProvider(widget.characterId).notifier);
    final hp = stats.hitPoints;

    if (maxHpController.text != '${hp.max}') {
      maxHpController.text = '${hp.max}';
    }
    if (maxBonusHpController.text != '${hp.maxBonus}') {
      maxBonusHpController.text = '${hp.maxBonus}';
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          HpDisplay(current: hp.current, max: hp.effectiveMax, temp: hp.temp),
          SizedBox(height: 24),
          CalculatorKeypad(
            onDigitPressed: onDigitPressed,
            onBackspace: onBackspace,
            inputValue: inputValue,
            rightColumn: Column(
              children: [
                PotionButton(
                  diceCount: 2,
                  modifier: 2,
                  label: 'Healing',
                  onHeal: notifier.heal,
                ),
                SizedBox(height: 8),
                PotionButton(
                  diceCount: 4,
                  modifier: 4,
                  label: 'Greater',
                  onHeal: notifier.heal,
                ),
                SizedBox(height: 8),
                PotionButton(
                  diceCount: 8,
                  modifier: 8,
                  label: 'Superior',
                  onHeal: notifier.heal,
                ),
                SizedBox(height: 8),
                PotionButton(
                  diceCount: 10,
                  modifier: 20,
                  label: 'Supreme',
                  onHeal: notifier.heal,
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ActionButton(
                  label: 'TEMPLATE',
                  color: Pallete.primary,
                  onPressed: parsedValue > 0
                      ? () {
                          notifier.addTempHp(parsedValue);
                          clearInput();
                        }
                      : null,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ActionButton(
                  label: 'HEALING',
                  color: Pallete.primary,
                  onPressed: parsedValue > 0
                      ? () {
                          notifier.heal(parsedValue);
                          clearInput();
                        }
                      : null,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ActionButton(
                  label: 'DAMAGE',
                  color: Pallete.primary,
                  onPressed: parsedValue > 0
                      ? () {
                          notifier.damage(parsedValue);
                          clearInput();
                        }
                      : null,
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                onPressed: () => setState(() {
                  showSettings = !showSettings;
                }),
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          if (showSettings) ...[
            SizedBox(height: 24),
            Text('HP Settings'),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: maxHpController,
                    labelText: 'Max HP',
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final parsed = int.tryParse(value);
                      if (parsed != null) {
                        notifier.updateHitPoints(max: parsed);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    controller: maxBonusHpController,
                    labelText: 'Max Bonus HP',
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final parsed = int.tryParse(value);
                      if (parsed != null) {
                        notifier.updateHitPoints(maxBonus: parsed);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
          SizedBox(height: 16),
          HitDiceSelector(
            hitDice: hp.hitDice,
            onChanged: (dice) => notifier.updateHitPoints(hitDice: dice),
            currentLevel: stats.level,
          ),
          SizedBox(height: 120),
        ],
      ),
    );
  }

  @override
  void dispose() {
    maxHpController.dispose();
    maxBonusHpController.dispose();
    super.dispose();
  }
}
