import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/controllers/user/upcoming_appointment_controller.dart';
import 'package:care_plus/data/doctor_appointment_data/doctor_about_and_appointment_data.dart';
import 'package:care_plus/data/upcoming_appointment_doctor_details_data/upcoming_appointment_doctor_details_data.dart';
import 'package:care_plus/models/ui_model/doctor_appointment_model/doctor_about_and_appointment_model.dart';
import 'package:care_plus/models/ui_model/upcoming_appointment_doctor_details_model/upcoming_appointment_doctor_details_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/upcoming_appointment_list_responses.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/doctor_about_and_appointment_widget/doctor_about_and_appointment_widget.dart';
import 'package:care_plus/views/widgets/upcoming_Appointment_Doctor_widget/upcoming_Appointment_Doctor_widget.dart';
import 'package:flutter/material.dart';

class UpcomingAppointmentDoctorDetails extends StatefulWidget {
  final UpcomingAppointment upcomingAppointmentDoctorDetails;
  const UpcomingAppointmentDoctorDetails({Key? key, required this.upcomingAppointmentDoctorDetails}) : super(key: key);

  @override
  _UpcomingAppointmentDoctorDetailsState createState() => _UpcomingAppointmentDoctorDetailsState();
}

class _UpcomingAppointmentDoctorDetailsState extends State<UpcomingAppointmentDoctorDetails> {



  // UpcomingAppointment responses = UpcomingAppointment(createdAt: null, doctor: null,
  //     updatedAt: null, appointmentFor: '', consult: '', userId: '', reschedule: '', appointmentSlot: null, id: null, active: '', doctorId: '', appointmentSlotId: '', date: null);




  @override
  void initState() {
    // TODO: implement initState
    // _getUpcomingAppointment();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
         //Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
         // Navigator.pop(context, true);
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Doctor", null),
        body: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          // <-- this will disable scroll
          shrinkWrap: true,
          children: [

            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: 1,
                        itemBuilder: (context,index) {
                          //var information = carePlushPrescriptionList[index];
                          return UpcomingAppointmentDoctorDetailsWidget(
                              widget.upcomingAppointmentDoctorDetails,
                              context);

                        }
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


