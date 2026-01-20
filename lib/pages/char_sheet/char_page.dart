import 'package:dnd_helper/pages/char_sheet/widgets/general_info.dart';
import 'package:flutter/material.dart';

class CharPage extends StatelessWidget {
  const CharPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Character Sheet')),
      body: Column(children: [GeneralInfo()]));
  }
}
