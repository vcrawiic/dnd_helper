class HitPoints {
  final int current;
  final int max;
  final int temp;
  final int maxBonus;
  final List<int> hitDice;

  const HitPoints({
    this.current = 10,
    this.max = 10,
    this.temp = 0,
    this.maxBonus = 0,
    this.hitDice = const [],
  });

  double get percentage => max > 0 ? current / effectiveMax : 0;
  int get effectiveMax => max + maxBonus;
  bool get isDead => current <= -effectiveMax;
  bool get isUnconscious => current <= 0 && !isDead;
  bool get isBloodied => current <= effectiveMax ~/ 2 && current > 0;

  HitPoints copyWith({
    int? current,
    int? max,
    int? temp,
    int? maxBonus,
    List<int>? hitDice,
  }) {
    return HitPoints(
      current: current ?? this.current,
      max: max ?? this.max,
      temp: temp ?? this.temp,
      maxBonus: maxBonus ?? this.maxBonus,
      hitDice: hitDice ?? this.hitDice,
    );
  }
}
