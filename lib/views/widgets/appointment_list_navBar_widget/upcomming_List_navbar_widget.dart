

import 'package:care_plus/models/ui_model/appointment_list_navBar/appointment_list_navBar.dart';
import 'package:care_plus/views/screens/doctor_appointment_pages/doctor_about_and_appointment_page.dart';
import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/upcoming_appointment_doctor_details/upcoming_appointment_doctor_details.dart';
import 'package:flutter/material.dart';

Widget Appointment_List(Appointment_list_navBar appointment_list_navBar, context) =>
    GestureDetector(
  child:   Card(

    child: Row(

        children: [

          Padding(

            padding: const EdgeInsets.only(top: 20),

            child: Image.asset(appointment_list_navBar.image,

            height: 90,

              width: 90,

            ),

          ),

          Expanded(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Container(

                        alignment: Alignment.centerLeft,

                        child: Text(appointment_list_navBar.name),

                    ),

                    Row(

                      children: [

                        Padding(

                          padding: const EdgeInsets.only(right: 0),

                          child: Container(

                            alignment: Alignment.centerRight,

                            child: Text(appointment_list_navBar.fee,

                            style: TextStyle(

                              color: Color(0xFF1CBFA8)

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

                          child: Text(appointment_list_navBar.department),

                        ),

                        Container(

                          alignment: Alignment.centerLeft,

                          child: Text(appointment_list_navBar.hospital),

                        ),

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

                        child: Text(appointment_list_navBar.date)),

                    Text(" | "),

                    Container(

                        alignment: Alignment.bottomLeft,

                        child: Text(appointment_list_navBar.time)),

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

                            Icons.message,

                          ),

                          iconSize: 20,

                          color: Color(0xFF1CBFA8),

                          splashColor: Color(0xFF1CBFA8),

                          onPressed: () {},

                        ),

                      ],

                    ),

                  ],

                ),

              ],

            ),

          ),

        ],

      ),



  ),
      onTap: (){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => UpcomingAppointmentDoctorDetails()));
      },
);