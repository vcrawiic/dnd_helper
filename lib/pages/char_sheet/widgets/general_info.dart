import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/xp_calculator_content.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/xp_progress_bar.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/settings/general_info/char_settings.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/state_chip.dart';
import 'package:flutter/material.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person_pin_sharp),
                ),
                const Column(children: [Text('name'), Text('Race - Class')]),
                const Placeholder(fallbackHeight: 40, fallbackWidth: 40),
              ],
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CharSettings(
                      title: 'XP Calculator',
                      body: XpCalculatorContent(
                        currentLevel: 3,
                        currentXp: 1086,
                        xpForCurrentLevel: 900,
                        xpForNextLevel: 2700,
                        canLevelUp: false,
                        onAddXp: (value) => debugPrint('Add XP: $value'),
                        onRemoveXp: (value) => debugPrint('Remove XP: $value'),
                        onLevelUp: () => debugPrint('Level Up!'),
                      ),
                    ),
                  ),
                );
              },
              child: const XpProgressBar(
                currentLevel: 3,
                currentXp: 1086,
                xpForCurrentLevel: 900,
                xpForNextLevel: 2700,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/Shield.png',
                          height: 50,
                          width: 50,
                          color: Colors.blue,
                        ),
                        const Text('AC'),
                      ],
                    ),
                    const Column(children: [Text('30'), Text('Speed')]),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mode_night_outlined),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.greenAccent),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Icon(Icons.trending_down_outlined),
                            Text('20/20'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: StateChip(label: 'Inspiration', value: '1'),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: StateChip(label: 'States', value: '12'),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: StateChip(label: 'Exhaustion', value: ''),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: StateChip(label: 'Initiative', value: ''),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
