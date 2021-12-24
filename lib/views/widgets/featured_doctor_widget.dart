
import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/responses_from_test_file/responses/user/featured_doctor_responses.dart';
import 'package:care_plus/views/screens/doctor_appointment_pages/doctor_about_and_appointment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
bool _loaded = false;
Widget buildDoctorListTile(FeaturedDoctorrr doctorFeturedlist, BuildContext context) => GestureDetector(
  child:   Card(

      child: Center(

        child: Row(

          children: [

            Container(

              height: 90,

              width: 90,

              child:  Image.network(  //

                  '$apiDomainRoot/images/${doctorFeturedlist.image}'
              ),
                  // :  Image.asset("images/download.png") ,

            ),

            Padding(

              padding: const EdgeInsets.only(left: 20),

              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(doctorFeturedlist.name,

                    style: TextStyle(

                        fontSize: 18,

                        fontWeight: FontWeight.bold

                    ),

                  ),



                  Padding(

                    padding: const EdgeInsets.only(top: 4, bottom: 5),

                    child: Text(doctorFeturedlist.specialization,

                      style: TextStyle(

                        fontSize: 15,

                        //fontWeight: FontWeight.bold

                      ),



                    ),

                  ),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      Text("Exp:    " + doctorFeturedlist.experience.replaceAll("null", "0")),

                      Padding(

                        padding: const EdgeInsets.only(left: 10),

                        child: Text("Fee:    " + "\$" + doctorFeturedlist.fee),

                      ),



                      Padding(

                        padding: const EdgeInsets.only(left: 10),

                        child: Text("Rating:    " + doctorFeturedlist.rating.replaceAll("[]", "0")),

                      ),



                    ],

                  ),



                ],

              ),

            ),

          ],

        ),

      )





  ),
  onTap: (){
    Navigator.push(context,MaterialPageRoute(builder: (context) => DoctorAppointment(fee: doctorFeturedlist.fee, rating: doctorFeturedlist.rating, image: doctorFeturedlist.image,
      address: doctorFeturedlist.address, specialization: doctorFeturedlist.specialization, department: doctorFeturedlist.department, visitingfee: doctorFeturedlist.visitingFee,
      hospital_name: doctorFeturedlist.hospitalName, chamber: doctorFeturedlist.chambers, about: doctorFeturedlist.introduction, experience: doctorFeturedlist.experience, name: doctorFeturedlist.name,docID: doctorFeturedlist.id,)));

  },
);