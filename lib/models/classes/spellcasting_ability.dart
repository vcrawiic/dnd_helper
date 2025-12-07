class SpellcastingAbility {
    String? name;
    List<dynamic>? skills;

    SpellcastingAbility({
        this.name,
        this.skills,
    });

    factory SpellcastingAbility.fromJson(Map<String, dynamic> json) => SpellcastingAbility(
        name: json["name"],
        skills: json["skills"] == null ? [] : List<dynamic>.from(json["skills"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
    };
}