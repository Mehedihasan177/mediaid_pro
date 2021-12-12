import 'package:care_plus/models/ui_model/upcoming_appointment_doctor_details_model/upcoming_appointment_doctor_details_model.dart';
import 'package:care_plus/views/widgets/doctor_about_and_appointment_widget/doctor_about_and_appointment_widget.dart';
import 'package:flutter/material.dart';

Widget UpcomingAppointmentDoctorDetailsWidget(
        UpcomingAppointmentDoctorDetailsModel upcomingAppointmentDoctorDetail,
        BuildContext context) =>
    Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 20),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      upcomingAppointmentDoctorDetail.image,
                      height: 80,
                      width: 80,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  upcomingAppointmentDoctorDetail.name,
                                  style: TextStyle(
                                      color: Color(0xff1CBFA8),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 140),
                                child: Text(
                                  upcomingAppointmentDoctorDetail.fee,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              height: 22,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            upcomingAppointmentDoctorDetail
                                                .department,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 5),
                                          child: Text(" at "),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            upcomingAppointmentDoctorDetail
                                                .hospital,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child:
                                  Text(upcomingAppointmentDoctorDetail.rate)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Stack(
            children: [
              designPortion(),
              designPortion1(),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 30),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.calendar_today_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 10),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      upcomingAppointmentDoctorDetail.date,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      upcomingAppointmentDoctorDetail.time,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 20),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                ),
                                child: Center(
                                    child:
                                        Image.asset("images/experience.png")),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 40),
                                  child: Text(
                                    upcomingAppointmentDoctorDetail.status,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    upcomingAppointmentDoctorDetail
                                        .status_status,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60, left: 30),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "About Doctor",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                        Text(
                          upcomingAppointmentDoctorDetail.about_doctor,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Working Time",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                upcomingAppointmentDoctorDetail.day,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                upcomingAppointmentDoctorDetail.time_range,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  // fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Appointment For",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                            color: Colors.black.withOpacity(0.5)
                        ),
                        ),),
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(upcomingAppointmentDoctorDetail.appointment_for,
                            style: TextStyle(
                              fontSize: 15
                            ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),

                  // Container(
                  //   child: ElevatedButton(
                  //     child: Text(
                  //       "Book Appointment",
                  //       style: TextStyle(color: Colors.white, fontSize: 20),
                  //     ),
                  //     onPressed: () async {
                  //       // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ConfirmaAppointment()));
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       minimumSize: const Size(350, 59),
                  //       maximumSize: const Size(350, 59),
                  //       primary: Color(0xFF1CBFA8),
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(15)),
                  //     ),
                  //   ),
                  //   decoration: BoxDecoration(
                  //       //color: Color(0xF60D72),
                  //       borderRadius: BorderRadius.circular(18)),
                  // ),

                ],
              ),
            ],
          ),
        ],
      ),
    );
