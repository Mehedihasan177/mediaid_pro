import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/models/ui_model/upcoming_appointment_doctor_details_model/upcoming_appointment_doctor_details_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/upcoming_appointment_list_responses.dart';
import 'package:care_plus/views/widgets/doctor_about_and_appointment_widget/doctor_about_and_appointment_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget UpcomingAppointmentDoctorDetailsWidget(
        UpcomingAppointment upcomingAppointmentDoctorDetail,
        BuildContext context) =>
    Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Card(
              child:  Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                            child: Image.network(
                              upcomingAppointmentDoctorDetail.doctor.image.toString()=='null'?
                              avatarLink:'$apiDomainRoot/images/${upcomingAppointmentDoctorDetail.doctor.image}',
                              fit: BoxFit.fill,
                              width: 100,
                              height: 100,
                            )),
                      ),
                    ),
                    SizedBox(width: 10,),

                    Expanded(
                      flex: 7,

                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceEvenly,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    upcomingAppointmentDoctorDetail.doctor.name,
                                    style: TextStyle(
                                        color: Color(0xff1CBFA8),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              height: 25,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            upcomingAppointmentDoctorDetail.doctor.specialization,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              top: 1.0),
                                          child: Container(
                                              alignment:
                                              Alignment.topLeft,
                                              child: Text(" at ")),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              bottom: 0),
                                          child: Container(
                                            alignment:
                                            Alignment.topLeft,
                                            child: Text(
                                              upcomingAppointmentDoctorDetail.doctor.hospitalName
                                                  .replaceAll("null",
                                                  "No hospital name"),
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text("Ratings: " + upcomingAppointmentDoctorDetail.doctor.rating),
                                      Icon(Icons.star,size: 17,color: Colors.yellow,)
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    height: 30,
                                    child: TextButton(
                                        child: Text(
                                            '\$'+upcomingAppointmentDoctorDetail.doctor.fee,
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
                                ],
                              )
                          ),
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
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      SizedBox(width: 20,),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                  height: 40,
                                  width: 40,
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
                                      size: 18,
                                    ),
                                  ),
                                ),
                              SizedBox(height: 10,),
                              Text(
                                "Appointment Date",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(

                                    child: Text(
                                      //DateFormat("dd-MM-yyyy").format(
                                      upcomingAppointmentDoctorDetail.appointmentSlot.day,
//),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      //DateFormat("dd-MM-yyyy").format(
                                      ", " + DateFormat("dd MMM yyyy").format(
                                          upcomingAppointmentDoctorDetail.date),
//),
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

                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      ),
                                    ),
                                    child: Center(
                                        child:Icon(
                                          Icons.timer_outlined,
                                          color: Colors.white,
                                          size: 18,
                                        )),
                                  ),
                                  SizedBox(height: 10,),
                                  Text('From: '+
                                      DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(upcomingAppointmentDoctorDetail
                                          .appointmentSlot.startTime))
                                          .replaceAll("null", "0"),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Text('Till: '+
                                        DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(upcomingAppointmentDoctorDetail
                                            .appointmentSlot.startTime))
                                            .replaceAll("null", "0"),
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60, left: 20),
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
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            upcomingAppointmentDoctorDetail.doctor.introduction
                                .replaceAll("null", "No about is available"),
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 8,left: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ///Department
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Department",
                                      style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        upcomingAppointmentDoctorDetail.doctor.department
                                            .replaceAll("null", "Not yet"),
                                        style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ///Specialization
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Specialization",
                                      style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        upcomingAppointmentDoctorDetail.doctor.specialization
                                            .replaceAll("null", "Not yet"),
                                        style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            ///address
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Address",
                                      style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        upcomingAppointmentDoctorDetail.doctor.address,
                                        style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ///Hospital Name
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Hospital Name",
                                      style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        upcomingAppointmentDoctorDetail.doctor.hospitalName
                                            .replaceAll("null", "Not yet"),
                                        style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            ///Chamber
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Chamber",
                                      style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        upcomingAppointmentDoctorDetail.doctor.chambers,
                                        style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ///Degree
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Degree",
                                      style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        upcomingAppointmentDoctorDetail.doctor.degree.toString().replaceAll("null", "Not Yet"),
                                        style: TextStyle(
                                          color:
                                          Colors.black.withOpacity(0.5),
                                          fontSize: 16,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

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
