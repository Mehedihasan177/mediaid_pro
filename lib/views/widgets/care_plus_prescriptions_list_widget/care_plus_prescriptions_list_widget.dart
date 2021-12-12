import 'package:care_plus/models/ui_model/care_plus_prescriptions_list_model/care_plus_prescriptions_list_model.dart';
import 'package:flutter/material.dart';

Widget CarePlusPrescriptionWidget(CarePlusPrescriptionListModel carePlushPrescriptionList) =>
    Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(carePlushPrescriptionList.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),
                      )),
                  SizedBox(height: 5,),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(carePlushPrescriptionList.department)),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Icon(Icons.calendar_today_rounded, size: 15,),
                      ),
                      SizedBox(width: 5,),
                      Text(carePlushPrescriptionList.date),
                      SizedBox(width: 10,),
                      Text(carePlushPrescriptionList.time),
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.07,
                // width: MediaQuery.of(context).size.width * 0.9,
                //color: Color(0xF60D72),
                child: ElevatedButton(

                    child: Text(
                      "View",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () async {
                      // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Otp()));

                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 25),
                      // maximumSize: const Size(50, 25),
                      primary: Color(0xFF1CBFA8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),

                // decoration: BoxDecoration(
                //   //color: Color(0xF60D72),
                //     borderRadius: BorderRadius.circular(18)),
              ),
            ),
          ],
        ),
      ),
    );