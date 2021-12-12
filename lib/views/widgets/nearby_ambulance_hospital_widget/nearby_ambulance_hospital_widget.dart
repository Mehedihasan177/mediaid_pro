import 'package:care_plus/views/screens/ambulance_list/ambulance_list.dart';
import 'package:care_plus/views/screens/hospital_list/hospital_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Nearby_ambulance_hospital(nearby_hospital_ambulance, context) =>
    Row(
    children: <Widget>[
     GestureDetector(
          onTap: (){
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => AmbulanceList()));
          },
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
                          padding: EdgeInsets.only(top: 10),
                            alignment: Alignment.topLeft,
                            child: Text(nearby_hospital_ambulance.ambulance,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(nearby_hospital_ambulance.text_for_ambulance,
                            ),
                          ),
                        ),

                      ],
                    ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    height: 65,
                    width: 65,
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
      GestureDetector(
          onTap: (){
            Navigator.pushReplacement(
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
                            padding: EdgeInsets.only(top: 10),
                            alignment: Alignment.topLeft,
                            child: Text(nearby_hospital_ambulance.hospital,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(nearby_hospital_ambulance.text_for_ambulance,
                              ),
                            ),
                          ),

                        ],
                      ),

                  SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Container(
                      height: 55,
                      width: 55,
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
