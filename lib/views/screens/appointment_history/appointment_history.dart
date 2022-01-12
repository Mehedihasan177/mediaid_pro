import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/constents/no_data_found.dart';
import 'package:care_plus/constents/shimmer.dart';
import 'package:care_plus/controllers/user/apponitment_cencel_controller.dart';
import 'package:care_plus/controllers/user/previous_appointment_controller.dart';
import 'package:care_plus/responses_from_test_file/responses/user/upcoming_appointment_list_responses.dart';
import 'package:care_plus/views/screens/upcoming_appointment_doctor_details/upcoming_appointment_doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../give_review.dart';

class AppointmentHistory extends StatefulWidget {
  const AppointmentHistory({Key? key}) : super(key: key);

  @override
  _AppointmentHistoryState createState() => _AppointmentHistoryState();
}

class _AppointmentHistoryState extends State<AppointmentHistory> {
  List<UpcomingAppointment> appointmentlistH = [];

int val = 0;
  _getPrevAppointment() async {
    PreviousAppointmentController.requestThenResponsePrint(USERTOKEN)
        .then((value) {
      setState(() {
        val = 1;
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
          val == 0 ? shimmer(context) : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 775,
              //color: Colors.red,
              child: appointmentlistH.isEmpty ? Center(
                child: NoDataFound("images/appointment_history.png", "No Appointment History"),
              ) : ListView.builder(
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
        child: Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // A pane can dismiss the Slidable.

            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (v) {
                  cancelThisAppointment(
                      appointment_list_navBar.id.toString(), index);
                  print("this is hot day");
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Card(
            child: Row(
              children: [
                ///circle image
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          '$apiDomainRoot/images/${appointment_list_navBar.doctor.image.toString()}',                      ),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
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
                                    height: 30,
                                    child: TextButton(
                                        child: Text(
                                            '\$'+appointment_list_navBar.doctor.fee,
                                            style: TextStyle(fontSize: 14)
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1CBFA8)),
                                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18.0),
                                                    side: BorderSide(color: Color(0xFF1CBFA8))
                                                )
                                            )
                                        ),
                                        onPressed: () => null
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
                                child: Text(DateFormat("dd MMMM yyyy")
                                    .format(appointment_list_navBar.date))),

                            Text(DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(appointment_list_navBar
                                .appointmentSlot.startTime)).toString()),
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
          endActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),
            //key: ValueKey(1),
            // A pane can dismiss the Slidable.
            // dismissible: DismissiblePane(onDismissed: () {}),

            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (v) {
                  //cancelThisAppointment(appointment_list_navBar.id.toString(),index);
                },
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.calendar_today_rounded,
                label: 'Reminder',
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
