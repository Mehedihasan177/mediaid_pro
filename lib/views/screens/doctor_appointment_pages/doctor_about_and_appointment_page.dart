import 'package:care_plus/data/doctor_appointment_data/doctor_about_and_appointment_data.dart';
import 'package:care_plus/models/ui_model/doctor_appointment_model/doctor_about_and_appointment_model.dart';
import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/doctor_about_and_appointment_widget/doctor_about_and_appointment_widget.dart';
import 'package:flutter/material.dart';

class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentState createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  List<DoctorAppointmentModel> doctorAppointment = List.of(doctor_appointment_data);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [


            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 750,
                    child: ListView.builder(
                      //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: doctorAppointment.length,
                        itemBuilder: (context,index) {
                          //var information = carePlushPrescriptionList[index];
                          return DoctorAboutAppointmentWidget(
                              doctorAppointment[index], context);

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


