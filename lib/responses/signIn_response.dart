// To parse this JSON data, do
//
//     final signIn = signInFromJson(jsonString);

import 'dart:convert';

// SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

// String signInToJson(SignIn data) => json.encode(data.toJson());

// class SignIn {
//   SignIn({
//     required this.message,
//     required this.data,
//   });
//
//   String message;
//   Data data;
//
//   factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
//     message: json["message"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "data": data.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     required this.user,
//     required this.token,
//   });
//
//   User user;
//   String token;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     user: User.fromJson(json["user"]),
//     token: json["token"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user": user.toJson(),
//     "token": token,
//   };
// }

class User {
  User({
    required this.id,
    required this.token,
    required this.adminId,
    required this.name,
    required this.email,
    required this.userid,
    required this.mobile,
    required this.dob,
    required this.address,
    required this.district,
    required this.policeStation,
    required this.postOffice,
    required this.status,
    required this.referralCode,
    required this.image,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.gender,
    required this.lat,
    required this.lng,
    required this.viewPassword,
    required this.parentId,
    required this.relationship,
    required this.deletedAt,
  });

  int id;
  String token;
  dynamic adminId;
  String name;
  String email;
  String userid;
  String mobile;
  dynamic dob;
  String address;
  dynamic district;
  dynamic policeStation;
  dynamic postOffice;
  int status;
  String referralCode;
  String image;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic gender;
  String lat;
  String lng;
  String viewPassword;
  dynamic parentId;
  dynamic relationship;
  dynamic deletedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    token: json["token"],
    adminId: json["admin_id"],
    name: json["name"],
    email: json["email"],
    userid: json["userid"],
    mobile: json["mobile"],
    dob: json["dob"],
    address: json["address"],
    district: json["district"],
    policeStation: json["police_station"],
    postOffice: json["post_office"],
    status: json["status"],
    referralCode: json["referral_code"],
    image: json["image"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    gender: json["gender"],
    lat: json["lat"],
    lng: json["lng"],
    viewPassword: json["view_password"],
    parentId: json["parent_id"],
    relationship: json["relationship"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
    "admin_id": adminId,
    "name": name,
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "gender": gender,
    "lat": lat,
    "lng": lng,
    "view_password": viewPassword,
    "parent_id": parentId,
    "relationship": relationship,
    "deleted_at": deletedAt,
  };
}
