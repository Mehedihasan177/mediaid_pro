import 'package:care_plus/views/screens/ambulance_list/ambulance_list.dart';
import 'package:care_plus/views/screens/hospital_list/hospital_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Nearby_ambulance_hospital(nearby_hospital_ambulance, context) =>
    Row(
    children: <Widget>[
     GestureDetector(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AmbulanceList()));
          },


       ///ambulance

          child: Card(
            shape:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)
            ),
            // height: 30,
            //color: Colors.white60.withOpacity(0.8),
            child: Row(
              children: [
                Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 35),
                            alignment: Alignment.topLeft,
                            child: Text(nearby_hospital_ambulance.ambulance,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 10, right: 20),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(nearby_hospital_ambulance.text_for_ambulance,
                            ),
                          ),
                        ),

                      ],
                    ),


                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    height: 70,
                    width:70,
                    child: Image(
                      image: AssetImage(nearby_hospital_ambulance.image_ambulance),
                    ),
                  ),
                ),
              ],
            ),

          ),
        ),


      SizedBox(
        width: 20,
      ),

      ///hospital

      GestureDetector(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HospitalList()));
          },
          child: Card(
              // height: 30,
              shape:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white)
              ),
              //color: Colors.white60.withOpacity(0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 40, left: 10),
                            alignment: Alignment.topLeft,
                            child: Text(nearby_hospital_ambulance.hospital,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(nearby_hospital_ambulance.text_for_hospital,
                              ),
                            ),
                          ),

                        ],
                      ),

                  SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Container(
                      height: 70,
                      width: 70,
                      child: Image(
                        image: AssetImage(nearby_hospital_ambulance.image),
                      ),
                    ),
                  ),
                ],
              ),


            ),
          
        ),

    ],
  );
