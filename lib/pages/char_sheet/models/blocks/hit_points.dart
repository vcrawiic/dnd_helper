class HitPoints {
    final int current;
    final int max;
    final int temp;

    const HitPoints({
      this.current = 10,
      this.max = 10,
      this.temp = 0,
    });

    double get percentage => max > 0 ? current / max : 0;

    bool get isDead => current <= -max;
    bool get isUnconscious => current <= 0 && !isDead;
    bool get isBloodied => current <= max ~/ 2 && current > 0;

    HitPoints copyWith({
      int? current,
      int? max,
      int? temp,
    }) {
      return HitPoints(
        current: current ?? this.current,
        max: max ?? this.max,
        temp: temp ?? this.temp,
      );
    }
  }