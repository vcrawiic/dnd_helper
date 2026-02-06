class Combat {
    final int armorClass;
    final int shieldAC;
    final int speed;
    final int initiative;

    const Combat({
      this.armorClass = 10,
      this.shieldAC = 0,
      this.speed = 30,
      this.initiative = 0,
    });

    int get totalAC => armorClass + shieldAC;

    Combat copyWith({
      int? armorClass,
      int? shieldAC,
      int? speed,
      int? initiative,
    }) {
      return Combat(
        armorClass: armorClass ?? this.armorClass,
        shieldAC: shieldAC ?? this.shieldAC,
        speed: speed ?? this.speed,
        initiative: initiative ?? this.initiative,
      );
    }
  }