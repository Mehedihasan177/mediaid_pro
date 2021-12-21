// To parse this JSON data, do
//
//     final updateProfileResponses = updateProfileResponsesFromJson(jsonString);

import 'dart:convert';

UpdateProfileResponses updateProfileResponsesFromJson(String str) => UpdateProfileResponses.fromJson(json.decode(str));

String updateProfileResponsesToJson(UpdateProfileResponses data) => json.encode(data.toJson());

class UpdateProfileResponses {
  UpdateProfileResponses({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory UpdateProfileResponses.fromJson(Map<String, dynamic> json) => UpdateProfileResponses(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    this.adminId,
    required this.name,
    this.weight,
    this.height,
    this.medicareNo,
    required this.email,
    required this.userid,
    required this.mobile,
    this.dob,
    required this.address,
    this.district,
    this.policeStation,
    this.postOffice,
    required this.status,
    required this.referralCode,
    this.image,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.gender,
   required this.lat,
   required this.lng,
    required this.viewPassword,
    this.parentId,
    this.relationship,
    this.deletedAt,
    required this.labReports,
  });

  String id;
  dynamic adminId;
  String name;
  dynamic weight;
  dynamic height;
  dynamic medicareNo;
  String email;
  String userid;
  String mobile;
  dynamic dob;
  String address;
  dynamic district;
  dynamic policeStation;
  dynamic postOffice;
  String status;
  String referralCode;
  dynamic image;
  dynamic emailVerifiedAt;
  String createdAt;
  String updatedAt;
  dynamic gender;
  String lat;
  String lng;
  String viewPassword;
  dynamic parentId;
  dynamic relationship;
  dynamic deletedAt;
  String labReports; //List<dynamic> labReports;

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
    id: json["id"].toString(),
    adminId: json["admin_id"],
    name: json["name"].toString(),
    weight: json["weight"].toString(),
    height: json["height"].toString(),
    medicareNo: json["medicare_no"],
    email: json["email"].toString(),
    userid: json["userid"].toString(),
    mobile: json["mobile"].toString(),
    dob: json["dob"],
    address: json["address"].toString(),
    district: json["district"],
    policeStation: json["police_station"],
    postOffice: json["post_office"],
    status: json["status"].toString(),
    referralCode: json["referral_code"].toString(),
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
    gender: json["gender"].toString(),
    lat: json["lat"].toString(),
    lng: json["lng"].toString(),
    viewPassword: json["view_password"].toString(),
    parentId: json["parent_id"],
    relationship: json["relationship"],
    deletedAt: json["deleted_at"],
    labReports: json["lab_reports"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "admin_id": adminId,
    "name": name,
    "weight": weight,
    "height": height,
    "medicare_no": medicareNo,
    "email": email,
    "userid": userid,
    "mobile": mobile,
    "dob": dob,
    "address": address,
    "district": district,
    "police_station": policeStation,
    "post_office": postOffice,
    "status": status,
    "referral_code": referralCode,
    "image": image,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "gender": gender,
    "lat": lat,
    "lng": lng,
    "view_password": viewPassword,
    "parent_id": parentId,
    "relationship": relationship,
    "deleted_at": deletedAt,
    "lab_reports": labReports,
  };
}
