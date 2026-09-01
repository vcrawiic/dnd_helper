import 'dart:ui';

import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/char_sheet/models/sheet_section.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/abilities/abilities_grid.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/general_info.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/section_placeholder.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/roll_result_stack.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/section_switcher.dart';
import 'package:dnd_helper/pages/char_sheet/widgets/section_tabs.dart';
import 'package:flutter/material.dart';

/// Интерактивный лист персонажа. Десктоп — характеристики колонками слева +
/// правая панель с табами; мобилка — сворачиваемая шапка + переключатель секций.
class CharPage extends StatefulWidget {
  final String characterId;

  const CharPage({super.key, required this.characterId});

  @override
  State<CharPage> createState() => _CharPageState();
}

class _CharPageState extends State<CharPage> {
  static const double _breakpoint = 900;

  SheetSection _section = SheetSection.abilities;

  List<SheetSection> get _rightSections =>
      SheetSection.values.where((s) => s != SheetSection.abilities).toList();

  Widget _sectionBody(SheetSection section) {
    if (section == SheetSection.abilities) {
      return AbilitiesGrid(characterId: widget.characterId);
    }
    return SectionPlaceholder(label: section.label);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/dung.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Pallete.transparent,
        // Контент проходит под аппбаром и навбаром (навбар — из MainShell),
        // а бары получают лёгкий блюр, сквозь который просвечивает контент.
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Pallete.transparent,
          surfaceTintColor: Pallete.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Pallete.primaryWhiteText),
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: const SizedBox.expand(),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= _breakpoint;
            return Stack(
              children: [
                SafeArea(
                  top: false,
                  bottom: false,
                  child: isWide ? _wide(context) : _narrow(context),
                ),
                // Стек последних бросков в левом нижнем углу. На узких экранах
                // навбар растянут на всю ширину — держим карточки внутри
                // SafeArea, чтобы не залезали под него. На десктоп/веб навбар
                // центрирован, слева свободно — опускаем карточки на его уровень
                // (иначе SafeArea оставляет большой отступ снизу).
                if (isWide)
                  const Positioned(
                    left: 16,
                    bottom: 16,
                    child: RollResultStack(),
                  )
                else
                  const SafeArea(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: RollResultStack(),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Верхний отступ, чтобы контент начинался под блюр-аппбаром, а не залезал
  /// под кнопку «назад».
  double _topInset(BuildContext context) =>
      MediaQuery.of(context).padding.top + kToolbarHeight;

  Widget _wide(BuildContext context) {
    final rightCurrent = _section == SheetSection.abilities
        ? _rightSections.first
        : _section;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, _topInset(context) + 8, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GeneralInfo(characterId: widget.characterId),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    // Отступ снизу, чтобы последняя карточка прокручивалась
                    // из-под навбара.
                    padding: const EdgeInsets.only(bottom: 120),
                    child: AbilitiesGrid(characterId: widget.characterId),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SectionTabs(
                        sections: _rightSections,
                        current: rightCurrent,
                        onChanged: (s) => setState(() => _section = s),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(bottom: 120),
                          child: _sectionBody(rightCurrent),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _narrow(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, _topInset(context) + 8, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GeneralInfo(characterId: widget.characterId),
          const SizedBox(height: 12),
          SectionSwitcher(
            current: _section,
            onChanged: (s) => setState(() => _section = s),
          ),
          const SizedBox(height: 12),
          _sectionBody(_section),
        ],
      ),
    );
  }
}
