class OrderInfo {
    String? name;
    List<String>? desc;

    OrderInfo({
        this.name,
        this.desc,
    });

    factory OrderInfo.fromJson(Map<String, dynamic> json) => OrderInfo(
        name: json["name"],
        desc: json["desc"] == null ? [] : List<String>.from(json["desc"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc == null ? [] : List<dynamic>.from(desc!.map((x) => x)),
    };
}