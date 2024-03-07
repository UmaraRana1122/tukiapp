// To parse this JSON data, do
//
//     final apartmentModel = apartmentModelFromJson(jsonString);

import 'dart:convert';

ApartmentModel apartmentModelFromJson(String str) =>
    ApartmentModel.fromJson(json.decode(str));

String apartmentModelToJson(ApartmentModel data) => json.encode(data.toJson());

class ApartmentModel {
  final List<Apartment>? apartments;

  ApartmentModel({
    this.apartments,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
        apartments: json["apartments"] == null
            ? []
            : List<Apartment>.from(
                json["apartments"]!.map((x) => Apartment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "apartments": apartments == null
            ? []
            : List<dynamic>.from(apartments!.map((x) => x.toJson())),
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
