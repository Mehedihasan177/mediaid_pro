class HospitalModel{

  late int    id;
  late String name;
  late String hospital;
  late String phone_number;
  late String address;
  late String website;
  late String image;
  late String about;
  late double latitude;
  late double longtitude;

  HospitalModel({
    required this.id,
    required this.name,
    required this.hospital,
    required this.phone_number,
    required this.address,
    required this.image,
    required this.about,
    required this.website,
    required this.latitude,
    required this.longtitude
  });
}