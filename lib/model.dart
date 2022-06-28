

import 'dart:convert';

class Guest {
  Guest({
    required this.id,
    required this.name,
    required this.pictureId,
    required this.location,
    required this.start,
    required this.email,
    required this.phoneNumber,
    required this.bookings,
  });

  String id;
  String name;
  String pictureId;
  String location;
  String start;
  String email;
  String phoneNumber;
  List<Booking> bookings;

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
    id: json["id"],
    name: json["name"],
    pictureId: json["pictureId"],
    location: json["location"],
    start: json["start"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    bookings: List<Booking>.from(json["bookings"].map((x) => Booking.fromJson(x))),
  );

}

class Booking {
  Booking({
    required this.idBooking,
    required this.placeBooking,
    required this.timePeriod,
    required this.status,
  });

  String idBooking;
  String placeBooking;
  String timePeriod;
  bool status;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    idBooking: json["id_booking"],
    placeBooking: json["place_booking"],
    timePeriod: json["time_period"],
    status: json["status"],
  );

}

//funct for parse
List<Guest> parseGuest(String? json){
  List<Guest> list ;
  if (json == null){
    return [];
  }

  var data = jsonDecode(json);
  var result = data["guest"] as List ;
  list = result.map<Guest>((json) => Guest.fromJson(json)).toList();
  return list ;
}
