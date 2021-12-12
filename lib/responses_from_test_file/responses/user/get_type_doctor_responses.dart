// To parse this JSON data, do
//
//     final getDoctorTypeResponse = getDoctorTypeResponseFromJson(jsonString);

import 'dart:convert';

GetDoctorTypeResponse getDoctorTypeResponseFromJson(String str) => GetDoctorTypeResponse.fromJson(json.decode(str));

String getDoctorTypeResponseToJson(GetDoctorTypeResponse data) => json.encode(data.toJson());

class GetDoctorTypeResponse {
  GetDoctorTypeResponse({
    required this.message,
    required this.getDoctorTypeResponse,
  });

  String message;
  List<GetDoctorTypeResponseElement> getDoctorTypeResponse;

  factory GetDoctorTypeResponse.fromJson(Map<String, dynamic> json) => GetDoctorTypeResponse(
    message: json["message"],
    getDoctorTypeResponse: List<GetDoctorTypeResponseElement>.from(json["GetDoctorTypeResponse"].map((x) => GetDoctorTypeResponseElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "GetDoctorTypeResponse": List<dynamic>.from(getDoctorTypeResponse.map((x) => x.toJson())),
  };
}

class GetDoctorTypeResponseElement {
  GetDoctorTypeResponseElement({
    required this.id,
    this.adminId,
    required this.name,
    required this.email,
    required this.referralCode,
    required this.doctorid,
    required this.mobile,
    this.nid,
    required this.bmdcReg,
    this.department,
    this.degree,
    this.designation,
    required this.specialization,
    this.dob,
    this.address,
    this.district,
    this.policeStation,
    this.postOffice,
    required this.status,
    this.image,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.gender,
    this.deletedAt,
    required this.visitingFee,
  });

  int id;
  dynamic adminId;
  String name;
  String email;
  String referralCode;
  String doctorid;
  String mobile;
  dynamic nid;
  String bmdcReg;
  dynamic department;
  dynamic degree;
  dynamic designation;
  String specialization;
  dynamic dob;
  dynamic address;
  dynamic district;
  dynamic policeStation;
  dynamic postOffice;
  int status;
  dynamic image;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic gender;
  dynamic deletedAt;
  VisitingFee visitingFee;

  factory GetDoctorTypeResponseElement.fromJson(Map<String, dynamic> json) => GetDoctorTypeResponseElement(
    id: json["id"],
    adminId: json["admin_id"],
    name: json["name"],
    email: json["email"],
    referralCode: json["referral_code"],
    doctorid: json["doctorid"],
    mobile: json["mobile"],
    nid: json["nid"],
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
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gender: json["gender"],
    deletedAt: json["deleted_at"],
    visitingFee: VisitingFee.fromJson(json["visiting_fee"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "name": name,
    "email": email,
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "gender": gender,
    "deleted_at": deletedAt,
    "visiting_fee": visitingFee.toJson(),
  };
}

class VisitingFee {
  VisitingFee({
    required this.id,
    required this.doctorId,
    required this.visitCharge,
    required this.commission,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  int doctorId;
  int visitCharge;
  int commission;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory VisitingFee.fromJson(Map<String, dynamic> json) => VisitingFee(
    id: json["id"],
    doctorId: json["doctor_id"],
    visitCharge: json["visit_charge"],
    commission: json["commission"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "visit_charge": visitCharge,
    "commission": commission,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
