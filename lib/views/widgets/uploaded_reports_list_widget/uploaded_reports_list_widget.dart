import 'package:care_plus/models/uploaded_reports_model/uploaded_reports_model.dart';
import 'package:flutter/material.dart';


Widget UploadedReportWidget(UploadedReportsmodel uploadedReportList) =>
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
                      child: Text(uploadedReportList.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),
                      )),
                  SizedBox(height: 5,),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(uploadedReportList.doctor_name)),
                  SizedBox(height: 5,),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(uploadedReportList.department)),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Icon(Icons.calendar_today_rounded, size: 15,),
                      ),
                      SizedBox(width: 5,),
                      Text(uploadedReportList.date),
                      SizedBox(width: 10,),
                      Text(uploadedReportList.time),
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
                child: Image.asset(
                  uploadedReportList.image,
                  height: 50,
                  width: 50,
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