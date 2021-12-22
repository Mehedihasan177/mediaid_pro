import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/models/ui_model/upcomming_appointment/upcomming_appointment_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/upcoming_appointment_list_responses.dart';
import 'package:care_plus/views/screens/doctor_appointment_pages/doctor_about_and_appointment_page.dart';
import 'package:care_plus/views/screens/upcoming_appointment_doctor_details/upcoming_appointment_doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

Widget upcommingAppointment(UpcomingAppointment upcomingAppointment, context) =>
    Container(
      width: 300,
        child: GestureDetector(
        child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                        DateFormat("dd MMMM, yyyy").format(upcomingAppointment.date),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      upcomingAppointment.doctor.name,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      upcomingAppointment.doctor.department,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Exp: " + upcomingAppointment.doctor.experience.replaceAll("null", "0"),
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 10),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      upcomingAppointment.doctor.hospitalName.replaceAll("null", "Dhaka Medical College"),
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image(
                image: NetworkImage(
                  '$apiDomainRoot/images/${upcomingAppointment.doctor.image.toString()}',
                ),
                height: 70,
                width: 70,
              ),
            ),
          ],
        ),
      ),
      // onTap: onCardTapped(upcomingAppointment),
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => UpcomingAppointmentDoctorDetails(upcomingAppointmentDoctorDetails: upcomingAppointment,)));
          },
    )
    );

// onCardTapped(UpcommingAppointment upcomingAppointment) {
//
//   print(upcomingAppointment.name);
// }
