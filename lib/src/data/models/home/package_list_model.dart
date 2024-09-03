// To parse this JSON data, do
//
//     final packageListModel = packageListModelFromJson(jsonString);

import 'dart:convert';

PackageListModel packageListModelFromJson(String str) => PackageListModel.fromJson(json.decode(str));

String packageListModelToJson(PackageListModel data) => json.encode(data.toJson());

class PackageListModel {
  String? code;
  String? status;
  String? message;
  List<PackageName>? responses;

  PackageListModel({
    this.code,
    this.status,
    this.message,
    this.responses,
  });

  factory PackageListModel.fromJson(Map<String, dynamic> json) => PackageListModel(
    code: json["code"],
    status: json["status"],
    message: json["message"],
    responses: json["response"] == null ? [] : List<PackageName>.from(json["response"]!.map((x) => PackageName.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
    "response": responses == null ? [] : List<dynamic>.from(responses!.map((x) => x.toJson())),
  };
}

class PackageName {
  String? title;
  String? price;
  String? desc;

  PackageName({
    this.title,
    this.price,
    this.desc,
  });

  factory PackageName.fromJson(Map<String, dynamic> json) => PackageName(
    title: json["title"],
    price: json["price"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "price": price,
    "desc": desc,
  };
}
