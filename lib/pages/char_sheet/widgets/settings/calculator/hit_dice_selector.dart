import 'package:dnd_helper/DS/pallete.dart';
import 'package:flutter/material.dart';

class HitDiceSelector extends StatefulWidget {
  final int currentLevel;
  final List<int> hitDice;
  final Function(List<int>) onChanged;
  const HitDiceSelector({
    super.key,
    required this.currentLevel,
    required this.onChanged,
    required this.hitDice,
  });

  @override
  State<HitDiceSelector> createState() => _HitDiceSelectorState();
}

class _HitDiceSelectorState extends State<HitDiceSelector> {
  bool _isMulticlass = false;
  int _selectedSingleDice = 8;
  int _d6Count = 0;
  int _d8Count = 0;
  int _d10Count = 0;
  int _d12Count = 0;

  @override
  void initState() {
    super.initState();
    _d6Count = widget.hitDice.where((d) => d == 6).length;
    _d8Count = widget.hitDice.where((d) => d == 8).length;
    _d10Count = widget.hitDice.where((d) => d == 10).length;
    _d12Count = widget.hitDice.where((d) => d == 12).length;

    final uniqueDice = widget.hitDice.toSet();
    _isMulticlass = uniqueDice.length > 1;

    if (!_isMulticlass && widget.hitDice.isNotEmpty) {
      _selectedSingleDice = widget.hitDice.first;
    }
  }

  int get totalAssigned => _d6Count + _d8Count + _d10Count + _d12Count;
  int get remaining => widget.currentLevel - totalAssigned;
  List<int> _buildHitDice() {
    return [
      ...List.filled(_d6Count, 6),
      ...List.filled(_d8Count, 8),
      ...List.filled(_d10Count, 10),
      ...List.filled(_d12Count, 12),
    ];
  }

  void _notify() {
    widget.onChanged(_buildHitDice());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildModeDropdown(),
        SizedBox(height: 16),
        if (_isMulticlass)
          _buildMulticlassSection()
        else
          _buildSingleClassSection(),
      ],
    );
  }

  Widget _buildModeDropdown() {
    return DropdownButton<bool>(
      value: _isMulticlass,
      isExpanded: true,
      underline: Container(height: 1, color: Pallete.greyDark),
      items: const [
        DropdownMenuItem(value: false, child: Text("Single Class")),
        DropdownMenuItem(value: true, child: Text("Multiclass")),
      ],
      onChanged: (value) {
        setState(() {
          _isMulticlass = value!;
          if (!_isMulticlass) {
            _d6Count = _selectedSingleDice == 6 ? widget.currentLevel : 0;
            _d8Count = _selectedSingleDice == 8 ? widget.currentLevel : 0;
            _d10Count = _selectedSingleDice == 10 ? widget.currentLevel : 0;
            _d12Count = _selectedSingleDice == 12 ? widget.currentLevel : 0;
            _notify();
          }
        });
      },
    );
  }

  Widget _buildSingleClassSection() {
    return DropdownButton<int>(
      value: _selectedSingleDice,
      isExpanded: true,
      underline: Container(height: 1, color: Pallete.greyDark),
      items: [6, 8, 10, 12].map((d) {
        return DropdownMenuItem(value: d, child: Text('К$d'));
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedSingleDice = value!;
          _d6Count = value == 6 ? widget.currentLevel : 0;
          _d8Count = value == 8 ? widget.currentLevel : 0;
          _d10Count = value == 10 ? widget.currentLevel : 0;
          _d12Count = value == 12 ? widget.currentLevel : 0;
          _notify();
        });
      },
    );
  }

  Widget _buildMulticlassSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Распределено костей: $totalAssigned/${widget.currentLevel}',
          style: TextStyle(color: Pallete.primaryWhiteText),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildDiceSlider('К6', _d6Count, (v) {
                setState(() {
                  _d6Count = v;
                });
                _notify();
              }),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _buildDiceSlider('К8', _d8Count, (v) {
                setState(() {
                  _d8Count = v;
                });
                _notify();
              }),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildDiceSlider('К10', _d10Count, (v) {
                setState(() {
                  _d10Count = v;
                });
                _notify();
              }),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _buildDiceSlider('К12', _d12Count, (v) {
                setState(() {
                  _d12Count = v;
                });
                _notify();
              }),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDiceSlider(
    String label,
    int count,
    ValueChanged<int> onChanged,
  ) {
    final maxForThis = count + remaining;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.casino_outlined, size: 24),
            SizedBox(width: 8),
            Text(label),
          ],
        ),
        Slider(
          value: count.toDouble(),
          min: 0,
          max: maxForThis.toDouble(),
          divisions: maxForThis > 0 ? maxForThis : 1,
          label: '$count',
          onChanged: maxForThis > 0 ? (v) => onChanged(v.toInt()) : null,
        ),
      ],
    );
  }
}
