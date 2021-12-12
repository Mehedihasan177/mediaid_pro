import 'package:flutter/material.dart';

Widget AmbulanceHospitalDetailsWidget(int id, String name, String hospital, String phone_number, String address, String website, double latitude, double longtitude, BuildContext context) =>
    Container(
     child: Column(
       children: [
         Text(hospital),
       ],
     ),
    );