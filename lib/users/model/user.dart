class User {
  int? id;
  String name;
  String email;
  String password;

  User(this.id, this.name, this.email, this.password);

  factory User.fromJson(Map<String, dynamic> json) => User(
        int.parse(json["id"]),
        json["name"],
        json["email"],
        json["password"],
      );

  Map<String, dynamic> toJson() => {
        'id': this.id.toString(),
        'name': this.name,
        'email': this.email,
        'password': this.password,
      };
}
