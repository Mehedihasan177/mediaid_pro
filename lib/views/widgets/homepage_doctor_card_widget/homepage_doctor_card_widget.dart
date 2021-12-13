import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/models/ui_model/doctor_informations/doctor_information_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/doctor_list_responses.dart';
import 'package:care_plus/views/screens/doctor_appointment_pages/doctor_about_and_appointment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget doctorList(Datum doctorINformation, context) => Container(
        child: GestureDetector(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.network(
                    '$apiDomainRoot/images/${doctorINformation.image}',
                    height: 70,
                    width: 70,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,top: 5),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            doctorINformation.name,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            height: 22,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      doctorINformation.chambers,
                                      style: TextStyle(
                                          fontSize: 15,),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      doctorINformation.hospitalName,
                                      style: TextStyle(
                                          fontSize: 15,),
                                    ),
                                  ),
                                ],
                              ),
                    ]
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: Container(
                            height: 22,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        doctorINformation.experience,
                                        style: TextStyle(
                                          fontSize: 15,),
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        doctorINformation.fee,
                                        style: TextStyle(
                                          fontSize: 15,),
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        doctorINformation.rating,
                                        style: TextStyle(
                                          fontSize: 15,),
                                      ),
                                    ),

                                  ],
                                ),
                                ]
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DoctorAppointment()));
          },
        ),
      );
    
