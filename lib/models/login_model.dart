// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final User? user;
  final String? message;

  LoginModel({
    this.user,
    this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "message": message,
      };
}

class User {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final dynamic nationality;
  final String? nationalId;
  final String? contact;
  final DateTime? birthdate;
  final dynamic avatar;
  final Role? role;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.nationality,
    this.nationalId,
    this.contact,
    this.birthdate,
    this.avatar,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        nationality: json["nationality"],
        nationalId: json["national_id"],
        contact: json["contact"],
        birthdate: json["birthdate"] == null
            ? null
            : DateTime.parse(json["birthdate"]),
        avatar: json["avatar"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "nationality": nationality,
        "national_id": nationalId,
        "contact": contact,
        "birthdate":
            "${birthdate!.year.toString().padLeft(4, '0')}-${birthdate!.month.toString().padLeft(2, '0')}-${birthdate!.day.toString().padLeft(2, '0')}",
        "avatar": avatar,
        "role": role?.toJson(),
      };
}

class Role {
  final String? id;
  final String? name;
  final String? key;

  Role({
    this.id,
    this.name,
    this.key,
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
