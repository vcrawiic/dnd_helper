// import 'package:dnd_helper/pages/char_sheet/widgets/settings/calculator/xp_progress_bar.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/state_chip.dart';
import 'package:flutter/material.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person_pin_sharp),
                ),
                Column(children: [Text('name'), Text('Race - Class')]),
                Placeholder(fallbackHeight: 40, fallbackWidth: 40),
              ],
            ),
            // XpProgressBar(
            //   currentLevel: null,
            //   currentXp: null,
            //   xpForCurrentLevel: null,
            //   xpForNextLevel: null,
            // ),
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
                        Text('AC'),
                      ],
                    ),
                    Column(children: [Text('30'), Text('Speed')]),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mode_night_outlined),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.greenAccent),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StateChip(label: 'Inspiration', value: '1'),
                StateChip(label: 'States', value: '12'),
                StateChip(label: 'Exhaustion', value: ''),
                StateChip(label: 'Initiative', value: ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
