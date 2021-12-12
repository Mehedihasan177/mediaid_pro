import 'package:care_plus/models/ui_model/specialist_information/information_model.dart';
import 'package:care_plus/views/screens/doctor_list_by_catagory/doctor_list_by_catagory.dart';
import 'package:flutter/material.dart';
var colors = [
  Color(0xFF1CBFA8).withOpacity(0.8),
  Colors.blue.withOpacity(0.8),
  Colors.red.withOpacity(0.8),
  Colors.green,
  Colors.yellow,
  Colors.deepPurpleAccent,
  Colors.green,
  Colors.yellow,
];
Widget Findspecialist(Diseasesinformation information, int index, context) =>Padding(

  padding: const EdgeInsets.only(right: 8),
  child: GestureDetector(
    child: Container(
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: colors[index],
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              '${information.name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 10, top: 15),
            child: Image(
              height: 25,
              width: 25,
              image: AssetImage(information.image),
            ),
          ),
        ],
      ),
    ),
    onTap: (){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DoctorListByCatagory()));

    },
  ),
);