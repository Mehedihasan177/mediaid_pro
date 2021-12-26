// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse signInResponseFromJson(String str) => SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory SignInResponse.fromJson(Map<dynamic, dynamic> json) => SignInResponse(
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
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    required this.id,
    required this.token,
    this.adminId,
    required this.name,
    required this.weight,
    required this.height,
    required this.medicareNo,
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
    required this.image,
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
  String token;
  dynamic adminId;
  String name;
  String weight;
  String height;
  String medicareNo;
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
  String image;
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

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
    id: json["id"].toString(),
    token: json["token"].toString(),
    adminId: json["admin_id"].toString(),
    name: json["name"].toString(),
    weight: json["weight"].toString(),
    height: json["height"].toString(),
    medicareNo: json["medicare_no"].toString(),
    email: json["email"].toString(),
    userid: json["userid"].toString(),
    mobile: json["mobile"].toString(),
    dob: json["dob"].toString(),
    address: json["address"].toString(),
    district: json["district"].toString(),
    policeStation: json["police_station"].toString(),
    postOffice: json["post_office"].toString(),
    status: json["status"].toString(),
    referralCode: json["referral_code"].toString(),
    image: json["image"].toString(),
    emailVerifiedAt: json["email_verified_at"].toString(),
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
    gender: json["gender"].toString(),
    lat: json["lat"].toString(),
    lng: json["lng"].toString(),
    viewPassword: json["view_password"].toString(),
    parentId: json["parent_id"].toString(),
    relationship: json["relationship"].toString(),
    deletedAt: json["deleted_at"].toString(),
    labReports: json["lab_reports"].toString(), //List<dynamic>.from(json["lab_reports"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
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
