

import 'package:care_plus/models/ui_model/appointment_list_navBar/appointment_history_navBar.dart';
import 'package:care_plus/models/ui_model/appointment_list_navBar/appointment_list_navBar.dart';
import 'package:care_plus/views/screens/care_plus_lab_report_list/care_plus_lab_report_list.dart';
import 'package:care_plus/views/screens/care_plus_prescriptions_list/care_plus_prescriptions_list.dart';
import 'package:care_plus/views/screens/doctor_appointment_pages/doctor_about_and_appointment_page.dart';
import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/uploaded_reports/uploaded_reports_list.dart';
import 'package:flutter/material.dart';

Widget Appointment_History(Appointment_History_navBar appointment_history_navBar, context) =>
    GestureDetector(
      child: Card(
  child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset(appointment_history_navBar.image,
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
                    child: Text(appointment_history_navBar.name),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(appointment_history_navBar.fee,
                            style: TextStyle(
                                color: Color(0xFF1CBFA8)
                            ),
                          ),
                        ),
                      ),
                      PopupMenuButton(
                        offset: Offset(-2.5, 0),
                        onSelected: (result) {
                          if (result == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CarePlusPrescriptionsList()),
                            );
                          }
                          else if(result == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CarePlusLabReportList()),
                            );
                          }
                          else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UploadedReports()),
                            );
                          }
                        },
                        itemBuilder: (_) => <PopupMenuEntry>[
                          const PopupMenuItem(
                            child: ListTile(
                                leading: Icon(Icons.note_add_outlined),
                                title:  Align(
                                  child: Text("Prescription"),
                                  alignment: Alignment(-1.78, 0),
                                ),
                            ),
                            value: 0,
                          ),
                          const PopupMenuItem(
                            child: ListTile(
                              leading: Icon(Icons.note_add_outlined),
                              title:  Align(
                                child: Text("Lab Suggestions"),
                                alignment: Alignment(-2.5, 0),
                              ),
                            ),
                            value: 1,
                          ),
                          const PopupMenuItem(
                            child: ListTile(
                              leading: Icon(Icons.note_add_outlined),
                              title:  Align(
                                child: Text("Uploaded Reports"),
                                alignment: Alignment(-3.0, 0),
                              ),
                            ),
                            value: 2,
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
                            child: Text(appointment_history_navBar.department),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(appointment_history_navBar.hospital),
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
                      child: Text(appointment_history_navBar.date)),
                  Text(" | "),
                  Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(appointment_history_navBar.time)),
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
    );
