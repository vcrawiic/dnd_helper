import 'package:dnd_helper/DS/dung_icons.dart';
import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

/// Тейблтоп (VTT) — батл-мапа в комнате. Пока заглушка: реалтайм-сцена,
/// токены, инициатива и туман войны появятся по мере готовности бэка (см. docs/backend_spec.md).
class TabletopPage extends StatelessWidget {
  const TabletopPage({super.key});

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
            'Тейблтоп',
            style: TextStyle(color: Pallete.secondaryBG, fontSize: 24),
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(DungIcons.fangs, color: Pallete.primary, size: 72),
              SizedBox(height: 16),
              Text(
                'Батл-мапа в разработке',
                style: TextStyle(
                  color: Pallete.primaryWhiteText,
                  fontSize: 20,
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
