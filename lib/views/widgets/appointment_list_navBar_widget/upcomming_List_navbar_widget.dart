

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/apponitment_cencel_controller.dart';
import 'package:care_plus/models/ui_model/appointment_list_navBar/appointment_list_navBar.dart';
import 'package:care_plus/responses_from_test_file/responses/user/upcoming_appointment_list_responses.dart';
import 'package:care_plus/views/screens/doctor_appointment_pages/doctor_about_and_appointment_page.dart';
import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/upcoming_appointment_doctor_details/upcoming_appointment_doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget Appointment_List(UpcomingAppointment appointment_list_navBar, context, int index) =>
    GestureDetector(
  child:   Card(

    child: Row(

        children: [

          Padding(

            padding: const EdgeInsets.only(top: 20),

            child: Container(
              height: 120,

              width: 120,
              child: Image.network(

                '$apiDomainRoot/images/${appointment_list_navBar.doctor.image.toString()}',



              ),
            ),

          ),

          Expanded(

            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      Container(

                          alignment: Alignment.centerLeft,

                          child: Text(appointment_list_navBar.doctor.name),


                      ),

                      Row(

                        children: [

                          Padding(

                            padding: const EdgeInsets.only(right: 0),

                            child: Container(

                              alignment: Alignment.centerRight,

                              child: Text("\$"+appointment_list_navBar.doctor.fee,

                              style: TextStyle(

                                color: Colors.red

                              ),

                              ),

                            ),

                          ),

                          PopupMenuButton(

                            itemBuilder: (_) => <PopupMenuEntry>[

                              const PopupMenuItem(

                                child: Text('Reshedule'),

                                value: 'hot',

                              ),

                              const PopupMenuItem(

                                child: Text('Set Reminder'),

                              ),

                              const PopupMenuItem(

                                child: Text('Cancel'),

                              ),

                            ],



                          )

                        ],

                      ),



                    ],

                  ),

                  Container(

                    height: 25,

                    child: ListView(

                      scrollDirection: Axis.horizontal,

                      children: [

                        Row(

                        children: [

                          Container(

                            alignment: Alignment.centerLeft,

                            child: Text(appointment_list_navBar.doctor.department),

                          ),

                          // Container(
                          //
                          //   alignment: Alignment.centerLeft,
                          //
                          //   child: Text(" at "+appointment_list_navBar.doctor.hospitalName),
                          //
                          // ),

                        ],

                      ),

                      ]

                    ),

                  ),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      Container(

                          alignment: Alignment.bottomLeft,

                          child: Text(
                              DateFormat("dd-MM-yyyy").format(appointment_list_navBar.date)
                          )
                      ),

                      // Text(" | "),
                      //
                      // Container(
                      //
                      //     alignment: Alignment.bottomLeft,
                      //
                      //     child: Text(DateFormat("H:m:s").format(appointment_list_navBar.date))),

                      Row(

                        children: [

                          IconButton(

                            icon: Icon(

                              Icons.call,

                            ),

                            iconSize: 20,

                            color: Color(0xFF1CBFA8),

                            splashColor: Color(0xFF1CBFA8),

                            onPressed: () {},

                          ),

                          IconButton(

                            icon: Icon(

                              Icons.cancel,

                            ),

                            iconSize: 20,

                            color: Colors.red,

                            splashColor: Color(0xFF1CBFA8),

                            onPressed: () {
                              print(appointment_list_navBar.doctor.id.toString());
                             // cancelThisAppointment(appointment_list_navBar.doctor.id.toString(),context);
                            },

                          ),

                        ],

                      ),

                    ],

                  ),

                ],

              ),
            ),

          ),

        ],

      ),



  ),
      onTap: (){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => UpcomingAppointmentDoctorDetails()));
      },
);

