import 'dart:convert';
import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/apponitment_cencel_controller.dart';
import 'package:care_plus/controllers/user/previous_appointment_controller.dart';
import 'package:care_plus/controllers/user/upcoming_appointment_controller.dart';
import 'package:care_plus/data/appointment_list_navbar/appointment_history_data.dart';
import 'package:care_plus/data/appointment_list_navbar/appointment_list_navbar_data.dart';
import 'package:care_plus/models/ui_model/appointment_list_navBar/appointment_history_navBar.dart';
import 'package:care_plus/models/ui_model/appointment_list_navBar/appointment_list_navBar.dart';
import 'package:care_plus/responses_from_test_file/responses/user/upcoming_appointment_list_responses.dart';
import 'package:care_plus/views/screens/give_review.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/upcoming_appointment_doctor_details/upcoming_appointment_doctor_details.dart';
import 'package:care_plus/views/widgets/appointment_list_navBar_widget/appointmnet_history_widget.dart';
import 'package:care_plus/views/widgets/appointment_list_navBar_widget/upcomming_List_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  List<UpcomingAppointment> appointmentlist = [];
  List<UpcomingAppointment> appointmentlistH = [];

  _getUpcomingAppointment() async {
    UpcomingAppointmentController.requestThenResponsePrint(USERTOKEN)
        .then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        appointmentlist = listNotification
            .map((model) => UpcomingAppointment.fromJson(model))
            .toList();
        print(appointmentlist);
      });
    });
  }
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
    _getUpcomingAppointment();
    _getPrevAppointment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Upcoming Appointments",
              style:
                  TextStyle(fontSize: 25, color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Container(
            // height: 430,
            // color: Colors.red,
            child: ListView.builder(
                //physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: appointmentlist.length,
                itemBuilder: (context, index) {
                  //return Appointment_List(appointmentlist[index], context);

                  if ((appointmentlist[index].active.toString() != '0') &&
                      (appointmentlist[index].consult == '0')) {
                    return Appointment_List(
                        appointmentlist[index], context, index);
                  } else {
                    return Container();
                    // return Appointment_List(appointmentlist[index], context, index);
                  }
                }),
          ),

          SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Appointment History",
              style:
                  TextStyle(fontSize: 25, color: Colors.black.withOpacity(0.5)),
            ),
          ),
          // Container(
          //   height: 390,
          //   // color: Colors.red,
          //   child: ListView.builder(
          //       // physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
          //       // shrinkWrap: true,
          //       scrollDirection: Axis.vertical,
          //       itemCount: 4,
          //       itemBuilder: (context, index) {
          //         return Appointment_History(appointmentHistoy[index], context);
          //       }),
          //
          // ),

          Container(
            // height: 300,
            // color: Colors.red,
            child: ListView.builder(
                //physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: appointmentlistH.length,
                itemBuilder: (context, index) {
                  return Appointment_ListHist(
                      appointmentlistH[index], context, index);
                  //return Appointment_List(appointmentlist[index], context);
                  if ((appointmentlist[index].active.toString() != '0') &&
                      (appointmentlist[index].consult == '1')) {
                    return Appointment_ListHist(
                        appointmentlist[index], context, index);
                  } else {
                    return Container();
                    // return Appointment_List(appointmentlist[index], context, index);
                  }
                }),
          ),

          ///this is the upcoming appiontment only for test. jehetu history api te data nai tai

          // Container(
          //   height: 300,
          //   // color: Colors.red,
          //   child: ListView.builder(
          //       physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
          //       shrinkWrap: true,
          //       scrollDirection: Axis.vertical,
          //       itemCount: appointmentlist.length,
          //       itemBuilder: (context, index) {
          //         return index <4 ?Appointment_List(appointmentlist[index], context): Container();
          //       }),
          //
          // ),
        ],
      ),
    );
  }

  Widget Appointment_List(UpcomingAppointment appointment_list_navBar, context, int index) =>
      GestureDetector(
        child: Card(
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
                                  child: Text(
                                    "\$" + appointment_list_navBar.doctor.fee,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                              PopupMenuButton(
                                itemBuilder: (_) => <PopupMenuEntry>[

                                  PopupMenuItem(
                                    child: Text('Set Reminder'),
                                  ),
                                  PopupMenuItem(
                                    child: Text('Cancel'),
                                    onTap: () {
                                      setState(() {
                                        print(appointment_list_navBar.doctor.id
                                            .toString());
                                        cancelThisAppointment(
                                            appointment_list_navBar.id
                                                .toString(),
                                            index);
                                      });
                                    },
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
                                  Icons.call,
                                ),
                                iconSize: 20,
                                color: Color(0xFF1CBFA8),
                                splashColor: Color(0xFF1CBFA8),
                                onPressed: () {},
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
  Widget Appointment_ListHist(UpcomingAppointment appointment_list_navBar, context, int index) =>
      GestureDetector(
        child: Card(
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
                  padding: const EdgeInsets.only(left: 20,right: 10),
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
            appointmentlist.removeAt(index);
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
