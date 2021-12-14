import 'package:care_plus/data/doctor_appointment_data/doctor_about_and_appointment_data.dart';
import 'package:care_plus/models/ui_model/doctor_appointment_model/doctor_about_and_appointment_model.dart';
import 'package:care_plus/views/screens/doctor_appointment_pages/doctor_about_and_appointment_page.dart';
import 'package:care_plus/views/widgets/confirmAppointment_widget/confirmAppointment_widget.dart';
import 'package:flutter/material.dart';

class ConfirmaAppointment extends StatefulWidget {
  const ConfirmaAppointment({Key? key}) : super(key: key);

  @override
  _ConfirmaAppointmentState createState() => _ConfirmaAppointmentState();
}

class _ConfirmaAppointmentState extends State<ConfirmaAppointment> {
  List<DoctorAppointmentModel> confirmAppointment =
      List.of(doctor_appointment_data);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => DoctorAppointment()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    splashColor: Colors.transparent,
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => DoctorAppointment()));
                    },
                  ),
                  Text(
                    "Confirm Appointment",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    // height: 750,
                    child: ListView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), // <-- this will disable scroll
                        shrinkWrap: true,
                        //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: confirmAppointment.length,
                        itemBuilder: (context, index) {
                          return ConfirmAppointmentWidget(
                              confirmAppointment[index], context);
                        }),
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
