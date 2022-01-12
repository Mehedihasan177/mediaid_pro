
import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/responses_from_test_file/responses/user/featured_doctor_responses.dart';
import 'package:care_plus/views/screens/doctor_appointment_pages/doctor_about_and_appointment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
bool _loaded = false;
Widget buildDoctorListTile(FeaturedDoctorrr doctorFeturedlist, BuildContext context) => GestureDetector(
  child:   Card(

      child:Row(

          children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      doctorFeturedlist.image.toString()=='null'?
                      avatarLink:'$apiDomainRoot/images/${doctorFeturedlist.image}'
                  ),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
              ),
            ),
          ),


            Expanded(
              flex: 6,
              child: Padding(

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

                      child: Container(
                        height: 18,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Text(doctorFeturedlist.specialization.replaceAll("null", "Specialization not given"),

                              style: TextStyle(

                                fontSize: 15,

                                //fontWeight: FontWeight.bold

                              ),



                            ),
                          ],
                        ),
                      ),

                    ),

                     Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text("Ratings: " + doctorFeturedlist.rating),
                                Icon(Icons.star,size: 17,color: Colors.yellow,)
                              ],
                            ),

                            // Row(
                            //   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //
                            //   children: [
                            //     Text("Ratings: " + doctorFeturedlist.rating),
                            //     Icon(Icons.star,size: 17,color: Colors.yellow,)
                            //   ],
                            // ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 10),
                              height: 30,
                              child: TextButton(
                                  child: Text(
                                      '\$'+doctorFeturedlist.fee,
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




                  ],

                ),

              ),
            ),

          ],

        ),







  ),
  onTap: (){
    Navigator.push(context,MaterialPageRoute(builder: (context) => DoctorAppointment(fee: doctorFeturedlist.fee, rating: doctorFeturedlist.rating, image: doctorFeturedlist.image,
      address: doctorFeturedlist.address, specialization: doctorFeturedlist.specialization, department: doctorFeturedlist.department, visitingfee: doctorFeturedlist.visitingFee,
      hospital_name: doctorFeturedlist.hospitalName, chamber: doctorFeturedlist.chambers, about: doctorFeturedlist.introduction, experience: doctorFeturedlist.experience, name: doctorFeturedlist.name,docID: doctorFeturedlist.id,degree: doctorFeturedlist.degree,)));

  },
);