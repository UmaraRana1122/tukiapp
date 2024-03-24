// To parse this JSON data, do
//
//     final upcomingEventModel = upcomingEventModelFromJson(jsonString);

import 'dart:convert';



class Event {
  final String? id;
  final EventType? eventType;
  final Name? name;
  final Description? description;
  final int? seats;
  final DateTime? startDate;
  final DateTime? endDate;
  final dynamic banner;
  final List<TimeSlot>? timeSlots;

  Event({
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

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        eventType: eventTypeValues.map[json["event_type"]]!,
        name: nameValues.map[json["name"]]!,
        description: descriptionValues.map[json["description"]]!,
        seats: json["seats"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        banner: json["banner"],
        timeSlots: json["time_slots"] == null
            ? []
            : List<TimeSlot>.from(
                json["time_slots"]!.map((x) => TimeSlot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_type": eventTypeValues.reverse[eventType],
        "name": nameValues.reverse[name],
        "description": descriptionValues.reverse[description],
        "seats": seats,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "banner": banner,
        "time_slots": timeSlots == null
            ? []
            : List<dynamic>.from(timeSlots!.map((x) => x.toJson())),
      };
}

enum Description {
  CEO_BIRTHDAY_PARTY_IS_ON_THIS_DAY,
  DESCRIPTION_OF_FIRST_EVENT,
  SPORTS_TENNIS_BALL_WILL_BE_PLAYED_IN_EVENT
}

final descriptionValues = EnumValues({
  "CEO Birthday party is on this day.":
      Description.CEO_BIRTHDAY_PARTY_IS_ON_THIS_DAY,
  "Description of first event.": Description.DESCRIPTION_OF_FIRST_EVENT,
  "Sports Tennis ball will be played in event.":
      Description.SPORTS_TENNIS_BALL_WILL_BE_PLAYED_IN_EVENT
});

enum EventType { OTHER, PARTY, SPORTS }

final eventTypeValues = EnumValues({
  "other": EventType.OTHER,
  "party": EventType.PARTY,
  "sports": EventType.SPORTS
});

enum Name { CEO_BIRTHDAY, EVENT_FIRST, TENNIS_BALL_PLAY }

final nameValues = EnumValues({
  "CEO Birthday": Name.CEO_BIRTHDAY,
  "Event First": Name.EVENT_FIRST,
  "Tennis ball Play": Name.TENNIS_BALL_PLAY
});

class TimeSlot {
  final String? id;
  final String? day;
  final String? startTime;
  final String? endTime;
  final int? availableSeats;

  TimeSlot({
    this.id,
    this.day,
    this.startTime,
    this.endTime,
    this.availableSeats,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
        id: json["id"],
        day: json["day"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        availableSeats: json["available_seats"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "start_time": startTime,
        "end_time": endTime,
        "available_seats": availableSeats,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
