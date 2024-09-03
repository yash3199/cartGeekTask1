// To parse this JSON data, do
//
//     final currentBookingListModel = currentBookingListModelFromJson(jsonString);

import 'dart:convert';

CurrentBookingListModel currentBookingListModelFromJson(String str) => CurrentBookingListModel.fromJson(json.decode(str));

String currentBookingListModelToJson(CurrentBookingListModel data) => json.encode(data.toJson());

class CurrentBookingListModel {
  String? code;
  String? status;
  String? message;
  List<CurrentBooking>? response;

  CurrentBookingListModel({
    this.code,
    this.status,
    this.message,
    this.response,
  });

  factory CurrentBookingListModel.fromJson(Map<String, dynamic> json) => CurrentBookingListModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    response: json["response"] == null ? [] : List<CurrentBooking>.from(json["response"]!.map((x) => CurrentBooking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
  };
}

class CurrentBooking {
  String? title;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  CurrentBooking({
    this.title,
    this.fromDate,
    this.fromTime,
    this.toDate,
    this.toTime,
  });

  factory CurrentBooking.fromJson(Map<String, dynamic> json) => CurrentBooking(
    title: json["title"],
    fromDate: json["from_date"],
    fromTime: json["from_time"],
    toDate: json["to_date"],
    toTime: json["to_time"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "from_date": fromDate,
    "from_time": fromTime,
    "to_date": toDate,
    "to_time": toTime,
  };
}
