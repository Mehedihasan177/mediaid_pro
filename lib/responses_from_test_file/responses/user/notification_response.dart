// To parse this JSON data, do
//
//     final notificationResponses = notificationResponsesFromJson(jsonString);

import 'dart:convert';

NotificationResponses notificationResponsesFromJson(String str) => NotificationResponses.fromJson(json.decode(str));

String notificationResponsesToJson(NotificationResponses data) => json.encode(data.toJson());

class NotificationResponses {
  NotificationResponses({
    required this.data,
  });

  List<NotificationRes> data;

  factory NotificationResponses.fromJson(Map<String, dynamic> json) => NotificationResponses(
    data: List<NotificationRes>.from(json["data"].map((x) => NotificationRes.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class NotificationRes {
  NotificationRes({
    required this.id,
    required this.userId,
    this.doctorId,
    this.pharmacyId,
    this.serviceProviderId,
    required this.type,
    required this.title,
    required this.body,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String userId;
  dynamic doctorId;
  dynamic pharmacyId;
  dynamic serviceProviderId;
  String type;
  String title;
  String body;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory NotificationRes.fromJson(Map<String, dynamic> json) => NotificationRes(
    id: json["id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    pharmacyId: json["pharmacy_id"],
    serviceProviderId: json["service_provider_id"],
    type: json["type"].toString(),
    title: json["title"],
    body: json["body"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "pharmacy_id": pharmacyId,
    "service_provider_id": serviceProviderId,
    "type": type,
    "title": title,
    "body": body,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
