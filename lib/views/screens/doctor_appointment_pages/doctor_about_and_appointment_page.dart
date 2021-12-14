import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/data/doctor_appointment_data/doctor_about_and_appointment_data.dart';
import 'package:care_plus/models/ui_model/doctor_appointment_model/doctor_about_and_appointment_model.dart';
import 'package:care_plus/views/screens/confirm_appointment/confirm_appointment.dart';
import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/doctor_about_and_appointment_widget/doctor_about_and_appointment_widget.dart';
import 'package:flutter/material.dart';

class DoctorAppointment extends StatefulWidget {
  final String name,
      specialization,
      hospital_name,
      fee,
      rating,
      experience,
      about,
      image,
      department;
  const DoctorAppointment({
    Key? key,
    required this.name,
    required this.specialization,
    required this.hospital_name,
    required this.fee,
    required this.rating,
    required this.experience,
    required this.about,
    required this.image,
    required this.department,
  }) : super(key: key);

  @override
  _DoctorAppointmentState createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  List<DoctorAppointmentModel> doctorAppointment =
      List.of(doctor_appointment_data);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [
            // Row(
            //   children: [
            //     Flexible(
            //       child: Container(
            //         //padding: EdgeInsets.only(left: 20),
            //         alignment: Alignment.centerLeft,
            //         height: 750,
            //         child: ListView.builder(
            //           //controller: PageController(viewportFraction: 0.3),
            //             scrollDirection: Axis.vertical,
            //             itemCount: doctorAppointment.length,
            //             itemBuilder: (context,index) {
            //               //var information = carePlushPrescriptionList[index];
            //               return DoctorAboutAppointmentWidget(
            //                   doctorAppointment[index], context);
            //
            //             }
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0, right: 0, bottom: 10),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 20),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                height: 120,
                                width: 120,
                                child: ClipRRect(
                                  child: Image.network(
                                    '$apiDomainRoot/images/${widget.image}',
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Expanded(
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
                                            widget.name,
                                            style: TextStyle(
                                                color: Color(0xff1CBFA8),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "\$ " + widget.fee,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 17,
                                                //fontWeight: FontWeight.bold
                                              ),
                                            ),
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
                                                    widget.specialization,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 1.0),
                                                  child: Container(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(" at ")),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 0),
                                                  child: Container(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                        widget.hospital_name.replaceAll("null", "No hospital name"),
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
                                      child: Text("Ratings: " + widget.rating)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40, left: 40),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.6),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(40),
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.people_outline,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 40),
                                        child: Text(
                                          widget.department,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Patients",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40, left: 50),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.6),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(40),
                                        ),
                                      ),
                                      child: Center(
                                          child: Image.asset(
                                              "images/experience.png")),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 40),
                                        child: Text(
                                          widget.experience.replaceAll("null", "0"),
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Experience",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.about.replaceAll(
                                        "null", "Haven't any description"),
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                      fontSize: 16
                                    ),
                                  ),
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
                                    // Container(
                                    //   alignment: Alignment.centerLeft,
                                    //   child: Text(
                                    //     doctorAppointment.day,
                                    //     style: TextStyle(
                                    //       color: Colors.black.withOpacity(0.5),
                                    //     ),
                                    //   ),
                                    // ),
                                    // Container(
                                    //   padding: EdgeInsets.only(left: 10),
                                    //   alignment: Alignment.centerLeft,
                                    //   child: Text(
                                    //     doctorAppointment.time_range,
                                    //     style: TextStyle(
                                    //       color: Colors.black.withOpacity(0.5),
                                    //       // fontSize: 16,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 20),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Available date and time",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                // Container(
                                //   margin: EdgeInsets.symmetric(vertical: 5.0),
                                //   height: 95.0,
                                //   child: ListView(
                                //     scrollDirection: Axis.horizontal,
                                //     children: [
                                //       Container(
                                //         width: 70,
                                //         child: Card(
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.circular(15.0),
                                //           ),
                                //           color: Colors.white,
                                //           child: Column(
                                //             children: [
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 10),
                                //                 child: Text(doctorAppointment.card_day,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 20),
                                //                 child: Text(doctorAppointment.card_date,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //       Container(
                                //         width: 70,
                                //         child: Card(
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.circular(15.0),
                                //           ),
                                //           color: Colors.white,
                                //           child: Column(
                                //             children: [
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 10),
                                //                 child: Text(doctorAppointment.card_day,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 20),
                                //                 child: Text(doctorAppointment.card_date,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //       Container(
                                //         width: 70,
                                //         child: Card(
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.circular(15.0),
                                //           ),
                                //           color: Colors.white,
                                //           child: Column(
                                //             children: [
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 10),
                                //                 child: Text(doctorAppointment.card_day,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 20),
                                //                 child: Text(doctorAppointment.card_date,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //       Container(
                                //         width: 70,
                                //         child: Card(
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.circular(15.0),
                                //           ),
                                //           color: Colors.white,
                                //           child: Column(
                                //             children: [
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 10),
                                //                 child: Text(doctorAppointment.card_day,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 20),
                                //                 child: Text(doctorAppointment.card_date,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //       Container(
                                //         width: 70,
                                //         child: Card(
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.circular(15.0),
                                //           ),
                                //           color: Colors.white,
                                //           child: Column(
                                //             children: [
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 10),
                                //                 child: Text(doctorAppointment.card_day,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 20),
                                //                 child: Text(doctorAppointment.card_date,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //       Container(
                                //         width: 70,
                                //         child: Card(
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.circular(15.0),
                                //           ),
                                //           color: Colors.white,
                                //           child: Column(
                                //             children: [
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 10),
                                //                 child: Text(doctorAppointment.card_day,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: const EdgeInsets.only(top: 20),
                                //                 child: Text(doctorAppointment.card_date,
                                //                   style: TextStyle(
                                //                       fontSize: 20,
                                //                       fontWeight: FontWeight.bold
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                //
                                // Container(
                                //   padding: EdgeInsets.only(top: 20),
                                //   alignment: Alignment.centerLeft,
                                //   child: Text(doctorAppointment.dateandtime,
                                //     style: TextStyle(
                                //         color: Colors.black.withOpacity(0.5),
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.bold
                                //     ),
                                //   ),
                                // ),

                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  height: 40.0,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      // Container(
                                      //   width: 90,
                                      //   child: Card(
                                      //     shape: RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.circular(15.0),
                                      //     ),
                                      //     color: Colors.white,
                                      //     child: Column(
                                      //       children: [
                                      //         Padding(
                                      //           padding: const EdgeInsets.only(top: 10),
                                      //           child: Center(
                                      //             child: Text(doctorAppointment.times,
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // Container(
                                      //   width: 90,
                                      //   child: Card(
                                      //     shape: RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.circular(15.0),
                                      //     ),
                                      //     color: Colors.white,
                                      //     child: Column(
                                      //       children: [
                                      //         Padding(
                                      //           padding: const EdgeInsets.only(top: 10),
                                      //           child: Center(
                                      //             child: Text(doctorAppointment.times,
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // Container(
                                      //   width: 90,
                                      //   child: Card(
                                      //     shape: RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.circular(15.0),
                                      //     ),
                                      //     color: Colors.white,
                                      //     child: Column(
                                      //       children: [
                                      //         Padding(
                                      //           padding: const EdgeInsets.only(top: 10),
                                      //           child: Center(
                                      //             child: Text(doctorAppointment.times,
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // Container(
                                      //   width: 90,
                                      //   child: Card(
                                      //     shape: RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.circular(15.0),
                                      //     ),
                                      //     color: Colors.white,
                                      //     child: Column(
                                      //       children: [
                                      //         Padding(
                                      //           padding: const EdgeInsets.only(top: 10),
                                      //           child: Center(
                                      //             child: Text(doctorAppointment.times,
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      // Container(
                                      //   width: 90,
                                      //   child: Card(
                                      //     shape: RoundedRectangleBorder(
                                      //       borderRadius: BorderRadius.circular(15.0),
                                      //     ),
                                      //     color: Colors.white,
                                      //     child: Column(
                                      //       children: [
                                      //         Padding(
                                      //           padding: const EdgeInsets.only(top: 10),
                                      //           child: Center(
                                      //             child: Text(doctorAppointment.times,
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 250),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                child: Text(
                                  "Book Appointment",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () async {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ConfirmaAppointment()));
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(350, 59),
                                  maximumSize: const Size(350, 59),
                                  primary: Color(0xFF1CBFA8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  //color: Color(0xF60D72),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  designPortion() => Row(
        children: [
          Flexible(
            child: Container(
              height: 550,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff1CBFA8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  topRight: Radius.circular(63),
                ),
              ),
            ),
          ),
        ],
      );

  designPortion1() => Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                height: 590,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(63),
                    topRight: Radius.circular(63),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
