class Translation {
  int? id;
  String? locale;
  String? title;
  String? description;
  String? address;
  String? term;

  Translation({
    this.id,
    this.locale,
    this.title,
    this.description,
    this.address,
    this.term,
  });

  Translation copyWith({
    int? id,
    String? locale,
    String? title,
    String? description,
    String? address,
    String? term,
  }) =>
      Translation(
        id: id ?? this.id,
        locale: locale ?? this.locale,
        title: title ?? this.title,
        description: description ?? this.description,
        address: address ?? this.address,
        term: term ?? this.term,
      );

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        locale: json["locale"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
    term: json["term"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "locale": locale,
        "title": title,
        "description": description,
        "address": address,
        "term": term,
      };
}
