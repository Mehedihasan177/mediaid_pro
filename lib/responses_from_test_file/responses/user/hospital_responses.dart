// To parse this JSON data, do
//
//     final hospitalResponses = hospitalResponsesFromJson(jsonString);

import 'dart:convert';

HospitalResponses hospitalResponsesFromJson(String str) => HospitalResponses.fromJson(json.decode(str));

String hospitalResponsesToJson(HospitalResponses data) => json.encode(data.toJson());

class HospitalResponses {
  HospitalResponses({
    required this.data,
  });

  List<HospitalRes> data;

  factory HospitalResponses.fromJson(Map<String, dynamic> json) => HospitalResponses(
    data: List<HospitalRes>.from(json["data"].map((x) => HospitalRes.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class HospitalRes {
  HospitalRes({
    required this.id,
    required this.name,
    required this.type,
    required this.address,
    required this.mobile,
    required this.description,
    required this.website,
    required this.image,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String name;
  String type;
  String address;
  String mobile;
  String description;
  String website;
  String image;
  dynamic createdAt;
  dynamic updatedAt;

  factory HospitalRes.fromJson(Map<String, dynamic> json) => HospitalRes(
    id: json["id"].toString(),
    name: json["name"].toString(),
    type: json["type"].toString(),
    address: json["address"].toString(),
    mobile: json["mobile"].toString(),
    description: json["description"].toString(),
    website: json["website"].toString(),
    image: json["image"].toString(),
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "address": address,
    "mobile": mobile,
    "description": description,
    "website": website,
    "image": image,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
