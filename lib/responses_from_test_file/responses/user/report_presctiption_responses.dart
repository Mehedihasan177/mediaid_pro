// To parse this JSON data, do
//
//     final reportPrescriptionResponses = reportPrescriptionResponsesFromJson(jsonString);

import 'dart:convert';

ReportPrescriptionResponses reportPrescriptionResponsesFromJson(String str) => ReportPrescriptionResponses.fromJson(json.decode(str));

String reportPrescriptionResponsesToJson(ReportPrescriptionResponses data) => json.encode(data.toJson());

class ReportPrescriptionResponses {
  ReportPrescriptionResponses({
    required this.message,
    required this.data,
  });

  String message;
  List<ReportPrescription> data;

  factory ReportPrescriptionResponses.fromJson(Map<String, dynamic> json) => ReportPrescriptionResponses(
    message: json["message"],
    data: List<ReportPrescription>.from(json["data"].map((x) => ReportPrescription.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ReportPrescription {
  ReportPrescription({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    required this.file,
    this.refDoctor,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String userId;
  String name;
  String type;
  String file;
  dynamic refDoctor;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory ReportPrescription.fromJson(Map<String, dynamic> json) => ReportPrescription(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    type: json["type"],
    file: json["file"],
    refDoctor: json["ref_doctor"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "type": type,
    "file": file,
    "ref_doctor": refDoctor,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
