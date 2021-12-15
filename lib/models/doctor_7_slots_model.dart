// To parse this JSON data, do
//
//     final doctor7SlotResponse = doctor7SlotResponseFromJson(jsonString);

import 'dart:convert';

Map<String, List<Doctor7SlotResponse>> doctor7SlotResponseFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<Doctor7SlotResponse>>(k, List<Doctor7SlotResponse>.from(v.map((x) => Doctor7SlotResponse.fromJson(x)))));

String doctor7SlotResponseToJson(Map<String, List<Doctor7SlotResponse>> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))));

class Doctor7SlotResponse {
  Doctor7SlotResponse({
    required this.id,
    required this.doctorId,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  String doctorId;
  String startTime;
  String endTime;
  String day;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Doctor7SlotResponse.fromJson(Map<String, dynamic> json) => Doctor7SlotResponse(
    id: json["id"],
    doctorId: json["doctor_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    day: json["day"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "start_time": startTime,
    "end_time": endTime,
    "day": day,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
