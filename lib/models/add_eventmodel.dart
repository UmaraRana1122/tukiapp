// To parse this JSON data, do
//
//     final addEventModel = addEventModelFromJson(jsonString);

import 'dart:convert';

AddEventModel addEventModelFromJson(String str) =>
    AddEventModel.fromJson(json.decode(str));

String addEventModelToJson(AddEventModel data) => json.encode(data.toJson());

class AddEventModel {
  final AddEvent? add;

  AddEventModel({
    this.add,
  });

  factory AddEventModel.fromJson(Map<String, dynamic> json) => AddEventModel(
        add: json["add"] == null ? null : AddEvent.fromJson(json["add"]),
      );

  Map<String, dynamic> toJson() => {
        "add": add?.toJson(),
      };
}

class AddEvent {
  final String? id;
  final String? eventType;
  final String? name;
  final String? description;
  final int? seats;
  final DateTime? startDate;
  final DateTime? endDate;
  final dynamic banner;
  final List<dynamic>? timeSlots;

  AddEvent({
    this.id,
    this.eventType,
    this.name,
    this.description,
    this.seats,
    this.startDate,
    this.endDate,
    this.banner,
    this.timeSlots,
  });

  factory AddEvent.fromJson(Map<String, dynamic> json) => AddEvent(
        id: json["id"],
        eventType: json["event_type"],
        name: json["name"],
        description: json["description"],
        seats: json["seats"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        banner: json["banner"],
        timeSlots: json["time_slots"] == null
            ? []
            : List<dynamic>.from(json["time_slots"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_type": eventType,
        "name": name,
        "description": description,
        "seats": seats,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "banner": banner,
        "time_slots": timeSlots == null
            ? []
            : List<dynamic>.from(timeSlots!.map((x) => x)),
      };
}
