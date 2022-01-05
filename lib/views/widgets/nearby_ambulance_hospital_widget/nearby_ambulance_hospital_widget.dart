import 'package:care_plus/views/screens/ambulance_list/ambulance_list.dart';
import 'package:care_plus/views/screens/hospital_list/hospital_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Nearby_ambulance_hospital(nearby_hospital_ambulance, context) =>
    Row(
    children: <Widget>[
      ///hospital

      GestureDetector(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HospitalList()));
        },
        child: Card(
          color: Colors.black54,
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
                            color: Colors.white

                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(nearby_hospital_ambulance.text_for_hospital,
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              SizedBox(width: 10),
              Container(
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        nearby_hospital_ambulance.image
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10,)
            ],
          ),


        ),

      ),
     GestureDetector(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AmbulanceList()));
          },


       ///ambulance

          child: Card(
            color: Colors.blue[500],
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
                                  color: Colors.white
                                )),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, top: 10, right: 20),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(nearby_hospital_ambulance.text_for_ambulance,
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                Container(
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          nearby_hospital_ambulance.image_ambulance
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10,)

              ],
            ),

          ),
        ),



    ],
  );
