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
      width: 290,
        child: GestureDetector(
        child: Card(
          //color: Colors.indigo,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Container(

                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        upcomingAppointment.doctor.image.toString()=='null'?
                        avatarLink:'$apiDomainRoot/images/${upcomingAppointment.doctor.image}'
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: Container(
                    height: 18,
                    alignment: Alignment.topLeft,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Text(
                          upcomingAppointment.doctor.specialization,
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 10),
                  child: Container(
                    height: 25,
                    alignment: Alignment.topLeft,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Text(
                          upcomingAppointment.doctor.hospitalName.replaceAll("null", ""),
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
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
