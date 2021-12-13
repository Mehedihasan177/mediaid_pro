// To parse this JSON data, do
//
//     final specializationResponse = specializationResponseFromJson(jsonString);

import 'dart:convert';

List<SpecializationResponse> specializationResponseFromJson(String str) => List<SpecializationResponse>.from(json.decode(str).map((x) => SpecializationResponse.fromJson(x)));

String specializationResponseToJson(List<SpecializationResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpecializationResponse {
  SpecializationResponse({
    required this.id,
    required this.name,
    required this.icon,
    required this.priority,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  String name;
  String icon;
  String priority;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory SpecializationResponse.fromJson(Map<dynamic, dynamic> json) => SpecializationResponse(
    id: json["id"],
    name: json["name"].toString(),
    icon: json["icon"].toString(),
    priority: json["priority"].toString(),
    status: json["status"].toString(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "priority": priority,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
