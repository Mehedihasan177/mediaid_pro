// To parse this JSON data, do
//
//     final doctorListResponse = doctorListResponseFromJson(jsonString);

import 'dart:convert';

DoctorListResponse doctorListResponseFromJson(String str) => DoctorListResponse.fromJson(json.decode(str));

String doctorListResponseToJson(DoctorListResponse data) => json.encode(data.toJson());

class DoctorListResponse {
  DoctorListResponse({
    required this.message,
    required this.data,
  });

  String message;
  List<FeaturedDoctorrr> data;

  factory DoctorListResponse.fromJson(Map<String, dynamic> json) => DoctorListResponse(
    message: json["message"],
    data: List<FeaturedDoctorrr>.from(json["data"].map((x) => FeaturedDoctorrr.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class FeaturedDoctorrr {
  FeaturedDoctorrr({
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
    required this.bmdcReg,
    required this.department,
    required this.degree,
    required this.designation,
    required this.specialization,
    this.dob,
    required this.address,
    required this.district,
    required this.policeStation,
    required this.postOffice,
    required this.status,
    required this.image,
    this.emailVerifiedAt,
    required this.featured,
    required this.chambers,
    required this.introduction,
    required this.createdAt,
    required this.updatedAt,
    required this.gender,
    this.deletedAt,
    required this.doctorService,
    required this.visitingFee,
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
  String bmdcReg;
  String department;
  String degree;
  String designation;
  String specialization;
  dynamic dob;
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
  String visitingFee;

  factory FeaturedDoctorrr.fromJson(Map<String, dynamic> json) => FeaturedDoctorrr(
    id: json["id"],
    adminId: json["admin_id"],
    name: json["name"],
    email: json["email"],
    hospitalName: json["hospital_name"].toString(),
    experience: json["experience"].toString(),
    fee: json["fee"].toString(),
    rating: json["rating"].toString(),
    referralCode: json["referral_code"],
    doctorid: json["doctorid"],
    mobile: json["mobile"],
    nid: json["nid"].toString(),
    bmdcReg: json["bmdc_reg"].toString(),
    department: json["department"].toString(),
    degree: json["degree"].toString(),
    designation: json["designation"].toString(),
    specialization: json["specialization"].toString(),
    dob: json["dob"],
    address: json["address"].toString(),
    district: json["district"].toString(),
    policeStation: json["police_station"].toString(),
    postOffice: json["post_office"].toString(),
    status: json["status"].toString(),
    image: json["image"].toString(),
    emailVerifiedAt: json["email_verified_at"],
    featured: json["featured"],
    chambers: json["chambers"].toString(),
    introduction: json["introduction"].toString(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gender: json["gender"].toString(),
    deletedAt: json["deleted_at"].toString(),
    doctorService: List<dynamic>.from(json["doctor_service"].map((x) => x)),
    visitingFee:json["visiting_fee"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "name": name,
    "email": email,
    "hospital_name": hospitalName == null ? null : hospitalName,
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
    "designation": designation == null ? null : designation,
    "specialization": specialization,
    "dob": dob,
    "address": address,
    "district": district,
    "police_station": policeStation,
    "post_office": postOffice,
    "status": status,
    "image": image == null ? null : image,
    "email_verified_at": emailVerifiedAt,
    "featured": featured,
    "chambers": chambers == null ? null : chambers,
    "introduction": introduction == null ? null : introduction,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "gender": gender,
    "deleted_at": deletedAt,
    "doctor_service": List<dynamic>.from(doctorService.map((x) => x)),
    "visiting_fee": visitingFee,
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
    required this.deletedAt,
  });

  int id;
  String doctorId;
  String visitCharge;
  String commission;
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
