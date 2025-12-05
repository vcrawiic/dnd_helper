class Proficiency {
    String? name;

    Proficiency({
        this.name,
    });

    factory Proficiency.fromJson(Map<String, dynamic> json) => Proficiency(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}