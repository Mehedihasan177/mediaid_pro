// To parse this JSON data, do
//
//     final upcomingAppointmentResponses = upcomingAppointmentResponsesFromJson(jsonString);

import 'dart:convert';

UpcomingAppointmentResponses upcomingAppointmentResponsesFromJson(String str) => UpcomingAppointmentResponses.fromJson(json.decode(str));

String upcomingAppointmentResponsesToJson(UpcomingAppointmentResponses data) => json.encode(data.toJson());

class UpcomingAppointmentResponses {
  UpcomingAppointmentResponses({
    required this.message,
    required this.data,
  });

  String message;
  List<UpcomingAppointment> data;

  factory UpcomingAppointmentResponses.fromJson(Map<String, dynamic> json) => UpcomingAppointmentResponses(
    message: json["message"],
    data: List<UpcomingAppointment>.from(json["data"].map((x) => UpcomingAppointment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class UpcomingAppointment {
  UpcomingAppointment({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.appointmentSlotId,
    required this.date,
    this.rescheduleDate,
    this.rescheduleSlotId,
    required this.appointmentFor,
    required this.active,
    required this.consult,
    required this.reschedule,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.doctor,
    required this.appointmentSlot,
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
  Doctor doctor;
  AppointmentSlot appointmentSlot;

  factory UpcomingAppointment.fromJson(Map<String, dynamic> json) => UpcomingAppointment(
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
    doctor: Doctor.fromJson(json["doctor"]),
    appointmentSlot: AppointmentSlot.fromJson(json["appointment_slot"]),
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
    "doctor": doctor.toJson(),
    "appointment_slot": appointmentSlot.toJson(),
  };
}

class AppointmentSlot {
  AppointmentSlot({
    required this.id,
    required this.doctorId,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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

  factory AppointmentSlot.fromJson(Map<String, dynamic> json) => AppointmentSlot(
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

class Doctor {
  Doctor({
    required this.id,
    this.adminId,
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
    this.bmdcReg,
    required this.department,
    required this.degree,
    this.designation,
    required this.specialization,
    this.dob,
    required this.address,
    this.district,
    this.policeStation,
    this.postOffice,
    required this.status,
    required this.image,
    this.emailVerifiedAt,
    required this.featured,
    required this.chambers,
    required this.introduction,
    required this.createdAt,
    required this.updatedAt,
    this.gender,
    this.deletedAt,
    required this.doctorService,
  });

  int id;
  dynamic adminId;
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
  dynamic bmdcReg;
  String department;
  String degree;
  dynamic designation;
  String specialization;
  dynamic dob;
  String address;
  dynamic district;
  dynamic policeStation;
  dynamic postOffice;
  String status;
  String image;
  dynamic emailVerifiedAt;
  String featured;
  String chambers;
  String introduction;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic gender;
  dynamic deletedAt;
  List<dynamic> doctorService;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    adminId: json["admin_id"],
    name: json["name"],
    email: json["email"],
    hospitalName: json["hospital_name"].toString(),
    experience: json["experience"].toString(),
    fee: json["fee"],
    rating: json["rating"],
    referralCode: json["referral_code"],
    doctorid: json["doctorid"],
    mobile: json["mobile"],
    nid: json["nid"].toString(),
    bmdcReg: json["bmdc_reg"],
    department: json["department"],
    degree: json["degree"],
    designation: json["designation"],
    specialization: json["specialization"],
    dob: json["dob"],
    address: json["address"],
    district: json["district"],
    policeStation: json["police_station"],
    postOffice: json["post_office"],
    status: json["status"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    featured: json["featured"],
    chambers: json["chambers"].toString(),
    introduction: json["introduction"].toString(),
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
