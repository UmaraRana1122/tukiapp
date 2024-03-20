// To parse this JSON data, do
//
//     final editProfileModel = editProfileModelFromJson(jsonString);

import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) =>
    EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) =>
    json.encode(data.toJson());

class EditProfileModel {
  final List<Owner>? owners;

  EditProfileModel({
    this.owners,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      EditProfileModel(
        owners: json["owners"] == null
            ? []
            : List<Owner>.from(json["owners"]!.map((x) => Owner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "owners": owners == null
            ? []
            : List<dynamic>.from(owners!.map((x) => x.toJson())),
      };
}

class Owner {
  final String? id;
  final Account? account;
  final dynamic eliminatedAccount;
  final Apartment? apartment;
  final dynamic ownership;

  Owner({
    this.id,
    this.account,
    this.eliminatedAccount,
    this.apartment,
    this.ownership,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        eliminatedAccount: json["eliminated_account"],
        apartment: json["apartment"] == null
            ? null
            : Apartment.fromJson(json["apartment"]),
        ownership: json["ownership"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account": account?.toJson(),
        "eliminated_account": eliminatedAccount,
        "apartment": apartment?.toJson(),
        "ownership": ownership,
      };
}

class Account {
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

  Account({
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

  factory Account.fromJson(Map<String, dynamic> json) => Account(
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

class Apartment {
  final String? id;
  final String? number;
  final String? licensePlate;
  final Community? community;

  Apartment({
    this.id,
    this.number,
    this.licensePlate,
    this.community,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
        id: json["id"],
        number: json["number"],
        licensePlate: json["license_plate"],
        community: json["community"] == null
            ? null
            : Community.fromJson(json["community"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "license_plate": licensePlate,
        "community": community?.toJson(),
      };
}

class Community {
  final String? id;
  final String? name;

  Community({
    this.id,
    this.name,
  });

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
