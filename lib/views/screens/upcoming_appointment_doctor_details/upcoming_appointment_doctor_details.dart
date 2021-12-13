import 'package:care_plus/data/doctor_appointment_data/doctor_about_and_appointment_data.dart';
import 'package:care_plus/data/upcoming_appointment_doctor_details_data/upcoming_appointment_doctor_details_data.dart';
import 'package:care_plus/models/ui_model/doctor_appointment_model/doctor_about_and_appointment_model.dart';
import 'package:care_plus/models/ui_model/upcoming_appointment_doctor_details_model/upcoming_appointment_doctor_details_model.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/doctor_about_and_appointment_widget/doctor_about_and_appointment_widget.dart';
import 'package:care_plus/views/widgets/upcoming_Appointment_Doctor_widget/upcoming_Appointment_Doctor_widget.dart';
import 'package:flutter/material.dart';

class UpcomingAppointmentDoctorDetails extends StatefulWidget {
  const UpcomingAppointmentDoctorDetails({Key? key}) : super(key: key);

  @override
  _UpcomingAppointmentDoctorDetailsState createState() => _UpcomingAppointmentDoctorDetailsState();
}

class _UpcomingAppointmentDoctorDetailsState extends State<UpcomingAppointmentDoctorDetails> {
  List<UpcomingAppointmentDoctorDetailsModel> upcomingAppointmentDoctorDetails = List.of(upcoming_appointment_doctor_details_data);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
          shrinkWrap: true,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: Row(
            //     children: [
            //       FlatButton(
            //         child: Icon(
            //           Icons.arrow_back_ios,
            //           size: 30,
            //           color: Colors.black.withOpacity(0.5),
            //         ),
            //         splashColor: Colors.transparent,
            //         onPressed: () {},
            //       ),
            //       Text("About Doctor",
            //         style: TextStyle(
            //           fontSize: 23,
            //           color: Colors.black.withOpacity(0.5),
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 750,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: upcomingAppointmentDoctorDetails.length,
                        itemBuilder: (context,index) {
                          //var information = carePlushPrescriptionList[index];
                          return UpcomingAppointmentDoctorDetailsWidget(
                              upcomingAppointmentDoctorDetails[index],
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

