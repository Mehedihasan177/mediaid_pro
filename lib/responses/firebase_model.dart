// To parse this JSON data, do
//
//     final callModule = callModuleFromJson(jsonString);

import 'dart:convert';

CallModule callModuleFromJson(String str) => CallModule.fromJson(json.decode(str));

String callModuleToJson(CallModule data) => json.encode(data.toJson());

class CallModule {
  CallModule({
    required this.doctor,
    required this.doctorImage,
    required this.time,
    required this.appointmentId,
    required this.callStatus,
    required this.patientId,
  });

  String doctor;
  String doctorImage;
  DateTime time;
  String appointmentId;
  String callStatus;
  String patientId;

  factory CallModule.fromJson(Map<String, dynamic> json) => CallModule(
    doctor: json["Doctor"],
    doctorImage: json["DoctorImage"],
    time: DateTime.parse(json["Time"]),
    appointmentId: json["appointment_id"],
    callStatus: json["call_status"],
    patientId: json["patient_id"],
  );

  Map<String, dynamic> toJson() => {
    "Doctor": doctor,
    "DoctorImage": doctorImage,
    "Time": time.toIso8601String(),
    "appointment_id": appointmentId,
    "call_status": callStatus,
    "patient_id": patientId,
  };
}
