import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/models/ui_model/specialist_information/information_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/specialization_responses.dart';
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
Widget Findspecialist(SpecializationResponse informationslist, BuildContext context, int index) =>Padding(

  padding: const EdgeInsets.only(right: 8),
  child: GestureDetector(
    child: Container(
      width: 115,
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
              '${informationslist.name}',
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
            padding: EdgeInsets.only(right: 10, top: 35),
            child: Image(
              height: 25,
              width: 25,
              image: NetworkImage(apiDomainRoot+'/'+informationslist.icon),
            ),
          ),
        ],
      ),
    ),
    onTap: (){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DoctorListByCatagory(name: informationslist.name)));

    },
  ),
);