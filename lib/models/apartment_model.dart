// To parse this JSON data, do
//
//     final apartmentModel = apartmentModelFromJson(jsonString);



class ApartmentModel {
  final String? id;
  final String? number;
  final String? licensePlate;
  final Community? community;

  ApartmentModel({
    this.id,
    this.number,
    this.licensePlate,
    this.community,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
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
