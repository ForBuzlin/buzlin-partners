class Client {
  int? id;
  String? firstname;
  String? lastname;
  bool? emptyP;
  int? active;
  String? role;
  String? img;

  Client({
    this.id,
    this.firstname,
    this.lastname,
    this.emptyP,
    this.active,
    this.role,
    this.img,
  });

  Client copyWith({
    int? id,
    String? firstname,
    String? lastname,
    bool? emptyP,
    int? active,
    String? role,
    String? img,
  }) =>
      Client(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        emptyP: emptyP ?? this.emptyP,
        active: active ?? this.active,
        role: role ?? this.role,
        img: img ?? this.img,
      );

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        emptyP: json["empty_p"],
        active: json["active"],
        role: json["role"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "empty_p": emptyP,
        "active": active,
        "role": role,
        "img": img,
      };
}
