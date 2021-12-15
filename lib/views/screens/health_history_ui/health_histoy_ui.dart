import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/view_all_prescription/userViewAllPrevPrescription.dart';
import 'package:care_plus/data/health_history/health_history_data.dart';
import 'package:care_plus/models/ui_model/health_histoy/health_history_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/report_presctiption_responses.dart';
import 'package:care_plus/views/screens/care_plus_lab_report_list/care_plus_lab_report_list.dart';
import 'package:care_plus/views/screens/care_plus_prescriptions_list/care_plus_prescriptions_list.dart';
import 'package:care_plus/views/screens/setUp_Profile/image_upload_page.dart';
import 'package:care_plus/views/screens/upload_documents/upload_documents.dart';
import 'package:care_plus/views/widgets/health_history_ui_widget/health_history_widget_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:intl/intl.dart';

class HealthHistory extends StatefulWidget {
  const HealthHistory({Key? key}) : super(key: key);

  @override
  _HealthHistoryState createState() => _HealthHistoryState();
}

class _HealthHistoryState extends State<HealthHistory> {


  //ReportPrescription data = ReportPrescription(userId: '', type: '', updatedAt: '', createdAt: '', file: '', name: '', id: 99, deletedAt: '', refDoctor: '');


//
  List<ReportPrescription> health_history = [];


  _getDoctorListByCatagory() async {


    UserViewAllPres.requestThenResponsePrint(context, USERTOKEN).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        health_history =
            listNotification.map((model) => ReportPrescription.fromJson(model)).toList();
        print(health_history);

      });
    });
  }

  @override
  void initState() {
    _getDoctorListByCatagory();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Health Reports",
                    style: TextStyle(color: Colors.blue, fontSize: 17, fontStyle: FontStyle.italic, decoration: TextDecoration.underline),
                  ),


                Container(
                  height: 40,
                  width: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NewImageUploadPage(page: 3,)));
                    },
                    child: Icon(Icons.add, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.only(right: 0),
                      primary: Color(0xFF1CBFA8), // <-- Button color
                      onPrimary: Color(0xFF1CBFA8), // <-- Splash color
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 700,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: health_history.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             CardDemo(arrSongList[index])));
                      },
                      child: Health_History_List(health_history[index], context));
                }),

          ),





        ],
      ),
    );
  }
}


