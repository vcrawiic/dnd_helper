class Conditions {
  final int inspiration;
  final int exhaustion;
  final List<String> states;
  final List<String> allConditions = const [
    'Blinded',
    'Charmed',
    'Deafened',
    'Frightened',
    'Grappled',
    'Incapacitated',
    'Invisible',
    'Paralyzed',
    'Petrified',
    'Poisoned',
    'Prone',
    'Restrained',
    'Stunned',
    'Unconscious',
  ];

  const Conditions({
    this.inspiration = 0,
    this.exhaustion = 0,
    this.states = const [],
  });

  bool get hasInspiration => inspiration > 0;
  bool get isExhausted => exhaustion > 0;
  bool get hasStates => states.isNotEmpty;

  bool get isDead => exhaustion >= 6;

  Conditions copyWith({
    int? inspiration,
    int? exhaustion,
    List<String>? states,
  }) {
    return Conditions(
      inspiration: inspiration ?? this.inspiration,
      exhaustion: exhaustion ?? this.exhaustion,
      states: states ?? this.states,
    );
  }
}
