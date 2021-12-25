import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/controllers/user/apponitment_cencel_controller.dart';
import 'package:care_plus/controllers/user/previous_appointment_controller.dart';
import 'package:care_plus/responses_from_test_file/responses/user/upcoming_appointment_list_responses.dart';
import 'package:care_plus/views/screens/upcoming_appointment_doctor_details/upcoming_appointment_doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../give_review.dart';

class AppointmentHistory extends StatefulWidget {
  const AppointmentHistory({Key? key}) : super(key: key);

  @override
  _AppointmentHistoryState createState() => _AppointmentHistoryState();
}

class _AppointmentHistoryState extends State<AppointmentHistory> {
  List<UpcomingAppointment> appointmentlistH = [];


  _getPrevAppointment() async {
    PreviousAppointmentController.requestThenResponsePrint(USERTOKEN)
        .then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        appointmentlistH = listNotification
            .map((model) => UpcomingAppointment.fromJson(model))
            .toList();
        print(appointmentlistH);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getPrevAppointment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Appointment History", null),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 775,
              //color: Colors.red,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), // <-- this will disable scroll
                  //shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: appointmentlistH.length,
                  itemBuilder: (context, index) {
                    return Appointment_ListHist(
                        appointmentlistH[index], context, index);
                    // //return Appointment_List(appointmentlist[index], context);
                    // if ((appointmentlist[index].active.toString() != '0') &&
                    //     (appointmentlist[index].consult == '1')) {
                    //   return Appointment_ListHist(
                    //       appointmentlist[index], context, index);
                    // } else {
                    //   return Container();
                    //   // return Appointment_List(appointmentlist[index], context, index);
                    // }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget Appointment_ListHist(UpcomingAppointment appointment_list_navBar, context, int index) =>
      GestureDetector(
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
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
                  padding: const EdgeInsets.only(left: 20,right: 10, top: 30),
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
                                  child: Text(
                                    "\$" + appointment_list_navBar.doctor.fee,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),

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
                                    child: Text(appointment_list_navBar
                                        .doctor.department),
                                  ),

                                ],
                              ),
                            ]),
                      ),

                      Container(

                        alignment: Alignment.centerLeft,
                        child: Text("For: "+appointment_list_navBar.appointmentFor.replaceAll('null', '')),

                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(DateFormat("dd-MM-yyyy || hh:mm a")
                                  .format(appointment_list_navBar.date))),
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
                                  Icons.rate_review,
                                ),
                                iconSize: 20,
                                color: Color(0xFF1CBFA8),
                                splashColor: Color(0xFF1CBFA8),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GiveReview(appointment: appointment_list_navBar,)));
                                },
                              ),
                              // IconButton(
                              //
                              //   icon: Icon(
                              //
                              //     Icons.cancel,
                              //
                              //   ),
                              //
                              //   iconSize: 20,
                              //
                              //   color: Colors.red,
                              //
                              //   splashColor: Color(0xFF1CBFA8),
                              //
                              //   onPressed: () {
                              //     print(appointment_list_navBar.doctor.id.toString());
                              //     cancelThisAppointment(appointment_list_navBar.id.toString(),index);
                              //   },
                              //
                              // ),
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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UpcomingAppointmentDoctorDetails(upcomingAppointmentDoctorDetails: appointment_list_navBar,)));
        },
      );

  void cancelThisAppointment(String appointmentID, int index) {
    AppointmentCencelController.requestThenResponsePrint(
        USERTOKEN, appointmentID)
        .then((value) {
      setState(() {
        print(value.statusCode);
        print(value.body);
        if (value.statusCode == 200) {
          setState(() {
            // Navigator.pop(context);
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNevigation()));
            appointmentlistH.removeAt(index);
          });
        }
      });
    });
  }

  void giveReview(UpcomingAppointment appointment_list_navBar) {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GiveReview(appointment: appointment_list_navBar,)));
    });
  }
}
