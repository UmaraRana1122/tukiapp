class UserModel {
  User user;
  String message;

  UserModel({
    required this.user,
    required this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "message": message,
      };
}

class User {
  String id;
  String email;
  dynamic firstName;
  dynamic lastName;
  dynamic contact;
  dynamic birthdate;
  dynamic nationalId;
  Role role;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.contact,
    required this.birthdate,
    required this.nationalId,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        contact: json["contact"],
        birthdate: json["birthdate"],
        nationalId: json["national_id"],
        role: Role.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "contact": contact,
        "birthdate": birthdate,
        "national_id": nationalId,
        "role": role.toJson(),
      };
}

class Role {
  String id;
  String name;
  String key;

  Role({
    required this.id,
    required this.name,
    required this.key,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "key": key,
      };
}
