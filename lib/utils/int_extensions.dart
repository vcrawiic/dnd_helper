extension ModifierFormat on int {
    String get asModifier => this >= 0 ? '+$this' : '$this';

    String get asModifierSpaced => this > 0 ? '+ $this' : '- ${abs()}';
  }