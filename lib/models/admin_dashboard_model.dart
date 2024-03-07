class AdminDashBoardModel {
  dynamic owners;
  dynamic guests;
  dynamic bookings;
  List<Event> events;

  AdminDashBoardModel({
    required this.owners,
    required this.guests,
    required this.bookings,
    required this.events,
  });

  factory AdminDashBoardModel.fromJson(Map<String, dynamic> json) =>
      AdminDashBoardModel(
        owners: json["owners"],
        guests: json["guests"],
        bookings: json["bookings"],
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "owners": owners,
        "guests": guests,
        "bookings": bookings,
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic seats;
  dynamic startTime;
  dynamic endTime;
  DateTime startDate;
  DateTime endDate;
  Ticket ticket;
  List<Pass> passes;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.seats,
    required this.startTime,
    required this.endTime,
    required this.startDate,
    required this.endDate,
    required this.ticket,
    required this.passes,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        seats: json["seats"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        ticket: json["ticket"] == null ? Ticket(id: 0,price: 0) : Ticket.fromJson(json["ticket"]),
        passes: json["passes"] == null
            ? []
            : List<Pass>.from(json["passes"].map((x) => Pass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "seats": seats,
        "start_time": startTime,
        "end_time": endTime,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "ticket": ticket?.toJson(),
        "passes": List<dynamic>.from(passes.map((x) => x.toJson())),
      };
}

class Pass {
  dynamic id;
  dynamic price;
  dynamic validDays;

  Pass({
    required this.id,
    required this.price,
    required this.validDays,
  });

  factory Pass.fromJson(Map<String, dynamic> json) => Pass(
        id: json["id"],
        price: json["price"],
        validDays: json["valid_days"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "valid_days": validDays,
      };
}

class Ticket {
  int id;
  double price;

  Ticket({
    required this.id,
    required this.price,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"]??0,
        price: json["price"]??0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
      };
}
