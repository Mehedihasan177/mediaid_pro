import 'package:care_plus/data/appointment_list_navbar/appointment_history_data.dart';
import 'package:care_plus/data/appointment_list_navbar/appointment_list_navbar_data.dart';
import 'package:care_plus/models/ui_model/appointment_list_navBar/appointment_history_navBar.dart';
import 'package:care_plus/models/ui_model/appointment_list_navBar/appointment_list_navBar.dart';
import 'package:care_plus/views/widgets/appointment_list_navBar_widget/appointmnet_history_widget.dart';
import 'package:care_plus/views/widgets/appointment_list_navBar_widget/upcomming_List_navbar_widget.dart';
import 'package:flutter/material.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  List<Appointment_list_navBar> appointmentlist = List.of(appointmentList);
  List<Appointment_History_navBar> appointmentHistoy = List.of(appointmentHistory);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text("Upcoming Appointments",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black.withOpacity(0.5)
            ),
            ),
          ),
          Container(
            height: 400,
            // color: Colors.red,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Appointment_List(appointmentlist[index], context);
                }),

          ),

          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text("Appointment History",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black.withOpacity(0.5)
              ),
            ),
          ),
          Container(
            height: 390,
            // color: Colors.red,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Appointment_History(appointmentHistoy[index], context);
                }),

          ),
        ],
      ),
    );
  }
}




