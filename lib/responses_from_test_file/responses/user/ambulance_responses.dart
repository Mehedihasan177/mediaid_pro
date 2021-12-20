// To parse this JSON data, do
//
//     final ambulanceResponses = ambulanceResponsesFromJson(jsonString);

import 'dart:convert';

AmbulanceResponses ambulanceResponsesFromJson(String str) => AmbulanceResponses.fromJson(json.decode(str));

String ambulanceResponsesToJson(AmbulanceResponses data) => json.encode(data.toJson());

class AmbulanceResponses {
  AmbulanceResponses({
    required this.data,
  });

  List<AmbulanceRes> data;

  factory AmbulanceResponses.fromJson(Map<String, dynamic> json) => AmbulanceResponses(
    data: List<AmbulanceRes>.from(json["data"].map((x) => AmbulanceRes.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AmbulanceRes {
  AmbulanceRes({
    required this.id,
    required this.hospitalId,
    required this.name,
    this.createdAt,
    this.updatedAt,
    required this.hospital,
  });

  String id;
  String hospitalId;
  String name;
  dynamic createdAt;
  dynamic updatedAt;
  Hospital hospital;

  factory AmbulanceRes.fromJson(Map<String, dynamic> json) => AmbulanceRes(
    id: json["id"].toString(),
    hospitalId: json["hospital_id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    hospital: Hospital.fromJson(json["hospital"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hospital_id": hospitalId,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "hospital": hospital.toJson(),
  };
}

class Hospital {
  Hospital({
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

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
    id: json["id"].toString(),
    name: json["name"],
    type: json["type"],
    address: json["address"],
    mobile: json["mobile"],
    description: json["description"],
    website: json["website"],
    image: json["image"],
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
