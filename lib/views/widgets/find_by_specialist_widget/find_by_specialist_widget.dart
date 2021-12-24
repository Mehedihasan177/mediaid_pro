import 'dart:math';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/models/ui_model/specialist_information/information_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/specialization_responses.dart';
import 'package:care_plus/views/screens/doctor_list_by_catagory/doctor_list_by_catagory.dart';
import 'package:flutter/material.dart';
var colors = [
  Colors.green,
  Colors.orange,
  Colors.deepPurpleAccent,
  Colors.red,
];
Widget Findspecialist(SpecializationResponse informationslist, BuildContext context, int index) {

  return Padding(

    padding: const EdgeInsets.only(right: 8),
    child: GestureDetector(
      child: Container(
        width: 115,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: (index%4)==0?colors[0]:(index%3)==0?colors[1]:(index%2)==0?colors[2]:colors[3],
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${informationslist.name}',
                    textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontSize: 14,),
                  )
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              // alignment: Alignment.bottomRight,
              // padding: EdgeInsets.only(right: 10, top: 5),
              child: Image(
                height: 35,
                width: 35,
                image: NetworkImage(apiDomainRoot+'/'+informationslist.icon),
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => DoctorListByCatagory(name: informationslist.name)));

      },
    ),
  );
}