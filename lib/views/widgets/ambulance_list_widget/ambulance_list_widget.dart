import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/models/ui_model/ambulance_model/ambulance_model.dart';
import 'package:care_plus/views/screens/ambulance_details/ambulance_details.dart';
import 'package:care_plus/views/screens/hospital_details_page/hospital_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

bool _loaded = false;


Widget AmbulanceHospitalWidget(
        String id,
        String type,
        String hospital,
        String about,
        String phone_number,
        String address,
        String image,
        String website,

        bool nevigation,
        BuildContext context) =>
    GestureDetector(
      child: Card(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 80, width: 80,
                    child: Image.network(
                    '$apiDomainRoot/images/${image}'
                )),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        //padding: ,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          hospital,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerLeft, child: Text(type)),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(phone_number)),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(address)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        if (nevigation == true) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HospitalDetailsPage(
                        name: type,
                        hospital: hospital,
                        about: about,
                        phone_number: phone_number,
                        address: address,
                        website: website,

                        image: image,
                      )));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AmbulanceDetailsPage(
                      name: type,
                      hospital: hospital,
                      details: about,
                      phone_number: phone_number,
                      address: address,
                      website: website,

                      image: image)));
        }
      },
    );
