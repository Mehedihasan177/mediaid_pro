import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/models/ui_model/health_histoy/health_history_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/report_presctiption_responses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:webview_flutter/webview_flutter.dart';

Widget Health_History_List(ReportPrescription health_history, BuildContext context) => Card(
  child: Row(
    children: [
      // Padding(
      //   padding: const EdgeInsets.only(top: 20),
      //   child: Container(
      //     height: 90,
      //     width: 90,
      //     child: Image.network(
      //       '$reportImageView/images/${health_history.file}',
      //       height: 90,
      //       width: 90,
      //     ),
      //   ),
      // ),
      Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 90,
            width: 90,
            child: Image.network(
               '$apiDomainRoot/files/${health_history.file.toString()}',
                //"$apiDomainRoot/api/view-file/" + health_history.file.toString()

            ),
          ),
        ),

      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [

              Container(
                alignment: Alignment.topLeft,
                child: Text(
                    health_history.type
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: Color(0xFF1CBFA8),
                    size: 15,
                  ),
                  SizedBox(width: 5,),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                        DateFormat('dd-MM-yyyy').format(health_history.createdAt)
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(left: 10),
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //       health_history.time
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.07,
          // width: MediaQuery.of(context).size.width * 0.9,
          //color: Color(0xF60D72),
          child: GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             CardDemo(Health_History[index])));
            },
            child: ElevatedButton(

              child: Text(
                "View",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                // String helloWorld =
                //     "$apiDomainRoot/api/view-file/" + health_history.file.toString();
                // print(helloWorld);

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => WebView(
                //         initialUrl: '$apiDomainRoot/api/view-file/ '+ health_history.file,
                //       )
                //   ),
                //
                // );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(0, 25),
                // maximumSize: const Size(50, 25),
                primary: Color(0xFF1CBFA8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
          // decoration: BoxDecoration(
          //   //color: Color(0xF60D72),
          //     borderRadius: BorderRadius.circular(18)),
        ),
      ),
    ],
  ),
);

