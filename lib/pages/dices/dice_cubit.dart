import 'package:dnd_helper/pages/dices/dice_state.dart';
import 'package:dnd_helper/services/dices/dice_roller_service.dart';
import 'package:dnd_helper/services/dices/models/dice_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiceCubit extends Cubit<DiceState> {
  final DiceRollerService _rollerService;

  DiceCubit(this._rollerService) : super(DiceState());

  void selectStandardDice(int sides) {
    emit(state.copyWith(sides: sides, isCustomDice: false, count: 1, rollCount: 1, modifier: 0, mode: RollMode.normal, dropLowest: false));
  }

  void setCustomDice(int sides) {
    emit(state.copyWith(sides: sides, isCustomDice: true, count: 1, rollCount: 1, modifier: 0, mode: RollMode.normal, dropLowest: false));
  }

  void setCount(int count) {
    if (count > 1 && state.mode != RollMode.normal) {
      emit(state.copyWith(count: count, mode: RollMode.normal));
    } else {
      emit(state.copyWith(count: count));
    }
  }

  void setRollCount(int rollCount) {
    emit(state.copyWith(rollCount: rollCount));
  }

  void setModifier(int modifier) {
    emit(state.copyWith(modifier: modifier));
  }

  void setMode(RollMode mode) {
    emit(state.copyWith(mode: mode));
  }

  void setDropLowest(bool dropLowest) {
    emit(state.copyWith(dropLowest: dropLowest));
  }

  void roll() {
    final results = _rollerService.rollDiceMultiple(
      sides: state.sides,
      count: state.count,
      modifier: state.modifier,
      mode: state.mode,
      rollCount: state.rollCount,
      dropLowest: state.dropLowest,
    );

    final rollGroup = DiceRollGroup(rolls: results);

    emit(
      state.copyWith(
        lastRollGroup: rollGroup,
        history: [rollGroup, ...state.history].take(20).toList(),
      ),
    );
  }

  void resetSettings() {
    emit(
      DiceState(
        history: state.history,
      ),
    );
  }

  void clearHistory() {
    emit(state.copyWith(history: []));
  }
}
