import 'dart:convert';

ViewModel viewModelFromJson(String str) => ViewModel.fromJson(json.decode(str));

String viewModelToJson(ViewModel data) => json.encode(data.toJson());

class ViewModel {
  final int? owners;
  final int? guests;
  final int? bookings;
  final List<Event>? events;

  ViewModel({
    this.owners,
    this.guests,
    this.bookings,
    this.events,
  });

  factory ViewModel.fromJson(Map<String, dynamic> json) => ViewModel(
        owners: json["owners"],
        guests: json["guests"],
        bookings: json["bookings"],
        events: json["events"] == null
            ? []
            : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "owners": owners,
        "guests": guests,
        "bookings": bookings,
        "events": events == null
            ? []
            : List<dynamic>.from(events!.map((x) => x.toJson())),
      };
}

class Event {
  final String? id;
  final String? eventType;
  final String? name;
  final String? description;
  final int? seats;
  final DateTime? startDate;
  final DateTime? endDate;
  final dynamic banner;
  final List<dynamic>? timeSlots;

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
