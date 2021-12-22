// To parse this JSON data, do
//
//     final userHealthHistory = userHealthHistoryFromJson(jsonString);

import 'dart:convert';

UserHealthHistory userHealthHistoryFromJson(String str) => UserHealthHistory.fromJson(json.decode(str));

String userHealthHistoryToJson(UserHealthHistory data) => json.encode(data.toJson());

class UserHealthHistory {
  UserHealthHistory({
    required this.report,
    required this.epres,
  });

  List<Report> report;
  List<Epre> epres;

  factory UserHealthHistory.fromJson(Map<String, dynamic> json) => UserHealthHistory(
    report: List<Report>.from(json["report"].map((x) => Report.fromJson(x))),
    epres: List<Epre>.from(json["epres"].map((x) => Epre.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "report": List<dynamic>.from(report.map((x) => x.toJson())),
    "epres": List<dynamic>.from(epres.map((x) => x.toJson())),
  };
}

class Epre {
  Epre({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.appointmentScheduleId,
    required this.cc,
    required this.oe,
    required this.advice,
    required this.rx,
    required this.problem,
    required this.dose,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.doctor,
    required this.appointmentSchedule,
  });

  int id;
  String userId;
  String doctorId;
  String appointmentScheduleId;
  String cc;
  String oe;
  String advice;
  String rx;
  dynamic problem;
  dynamic dose;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Doctor doctor;
  AppointmentSchedule appointmentSchedule;

  factory Epre.fromJson(Map<String, dynamic> json) => Epre(
    id: json["id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    appointmentScheduleId: json["appointment_schedule_id"],
    cc: json["cc"],
    oe: json["oe"],
    advice: json["advice"],
    rx: json["rx"],
    problem: json["problem"].toString(),
    dose: json["dose"].toString(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    doctor: Doctor.fromJson(json["doctor"]),
    appointmentSchedule: AppointmentSchedule.fromJson(json["appointment_schedule"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "appointment_schedule_id": appointmentScheduleId,
    "cc": cc,
    "oe": oe,
    "advice": advice,
    "rx": rx,
    "problem": problem,
    "dose": dose,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "doctor": doctor.toJson(),
    "appointment_schedule": appointmentSchedule.toJson(),
  };
}

class AppointmentSchedule {
  AppointmentSchedule({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.appointmentSlotId,
    required this.date,
    required this.rescheduleDate,
    required this.rescheduleSlotId,
    required this.appointmentFor,
    required this.active,
    required this.consult,
    required this.reschedule,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  String userId;
  String doctorId;
  String appointmentSlotId;
  DateTime date;
  dynamic rescheduleDate;
  dynamic rescheduleSlotId;
  String appointmentFor;
  String active;
  String consult;
  String reschedule;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory AppointmentSchedule.fromJson(Map<String, dynamic> json) => AppointmentSchedule(
    id: json["id"],
    userId: json["user_id"],
    doctorId: json["doctor_id"],
    appointmentSlotId: json["appointment_slot_id"],
    date: DateTime.parse(json["date"]),
    rescheduleDate: json["reschedule_date"],
    rescheduleSlotId: json["reschedule_slot_id"],
    appointmentFor: json["appointment_for"].toString(),
    active: json["active"],
    consult: json["consult"],
    reschedule: json["reschedule"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "doctor_id": doctorId,
    "appointment_slot_id": appointmentSlotId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "reschedule_date": rescheduleDate,
    "reschedule_slot_id": rescheduleSlotId,
    "appointment_for": appointmentFor,
    "active": active,
    "consult": consult,
    "reschedule": reschedule,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}

class Doctor {
  Doctor({
    required this.id,
    required this.adminId,
    required this.name,
    required this.email,
    required this.hospitalName,
    required this.experience,
    required this.fee,
    required this.rating,
    required this.referralCode,
    required this.doctorid,
    required this.mobile,
    required this.nid,
    required this.bmdcReg,
    required this.department,
    required this.degree,
    required this.designation,
    required this.specialization,
    required this.dob,
    required this.address,
    required this.district,
    required this.policeStation,
    required this.postOffice,
    required this.status,
    required this.image,
    required this.emailVerifiedAt,
    required this.featured,
    required this.chambers,
    required this.introduction,
    required this.createdAt,
    required this.updatedAt,
    required this.gender,
    required this.deletedAt,
    required this.doctorService,
  });

  int id;
  String adminId;
  String name;
  String email;
  String hospitalName;
  String experience;
  String fee;
  String rating;
  String referralCode;
  String doctorid;
  String mobile;
  String nid;
  String bmdcReg;
  String department;
  String degree;
  String designation;
  String specialization;
  String dob;
  String address;
  String district;
  String policeStation;
  String postOffice;
  String status;
  String image;
  dynamic emailVerifiedAt;
  String featured;
  String chambers;
  String introduction;
  DateTime createdAt;
  DateTime updatedAt;
  String gender;
  dynamic deletedAt;
  List<dynamic> doctorService;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    adminId: json["admin_id"].toString(),
    name: json["name"],
    email: json["email"],
    hospitalName: json["hospital_name"],
    experience: json["experience"],
    fee: json["fee"],
    rating: json["rating"],
    referralCode: json["referral_code"],
    doctorid: json["doctorid"],
    mobile: json["mobile"],
    nid: json["nid"].toString(),
    bmdcReg: json["bmdc_reg"].toString(),
    department: json["department"],
    degree: json["degree"],
    designation: json["designation"],
    specialization: json["specialization"],
    dob: json["dob"].toString(),
    address: json["address"],
    district: json["district"].toString(),
    policeStation: json["police_station"].toString(),
    postOffice: json["post_office"].toString(),
    status: json["status"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    featured: json["featured"],
    chambers: json["chambers"],
    introduction: json["introduction"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gender: json["gender"],
    deletedAt: json["deleted_at"],
    doctorService: List<dynamic>.from(json["doctor_service"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "name": name,
    "email": email,
    "hospital_name": hospitalName,
    "experience": experience,
    "fee": fee,
    "rating": rating,
    "referral_code": referralCode,
    "doctorid": doctorid,
    "mobile": mobile,
    "nid": nid,
    "bmdc_reg": bmdcReg,
    "department": department,
    "degree": degree,
    "designation": designation,
    "specialization": specialization,
    "dob": dob,
    "address": address,
    "district": district,
    "police_station": policeStation,
    "post_office": postOffice,
    "status": status,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "featured": featured,
    "chambers": chambers,
    "introduction": introduction,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "gender": gender,
    "deleted_at": deletedAt,
    "doctor_service": List<dynamic>.from(doctorService.map((x) => x)),
  };
}

class Report {
  Report({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    required this.file,
    required this.refDoctor,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  String userId;
  String name;
  String type;
  String file;
  String refDoctor;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    type: json["type"],
    file: json["file"],
    refDoctor: json["ref_doctor"].toString(),
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
