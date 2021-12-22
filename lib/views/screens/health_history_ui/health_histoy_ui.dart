import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/others/viewUserHealthHistory.dart';
import 'package:care_plus/controllers/user/view_all_prescription/userViewAllPrevPrescription.dart';
import 'package:care_plus/data/health_history/health_history_data.dart';
import 'package:care_plus/models/ui_model/health_histoy/health_history_model.dart';
import 'package:care_plus/responses/others/userHealthHistory.dart';
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
  List<Health_History> health_history = [];


  // _getDoctorListByCatagory() async {
  //
  //
  //   UserViewAllPres.requestThenResponsePrint(context, USERTOKEN).then((value) {
  //     setState(() {
  //       print(value.body);
  //       Map<String, dynamic> decoded = json.decode("${value.body}");
  //       Iterable listNotification = decoded['data'];
  //       print(decoded['data']);
  //       health_history =
  //           listNotification.map((model) => ReportPrescription.fromJson(model)).toList();
  //       print(health_history);
  //
  //     });
  //   });
  // }

  @override
  void initState() {
    // _getDoctorListByCatagory();
    getPatientHealthHistory();
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
                // Text(
                //     "Add Health Reports",
                //     style: TextStyle(color: Colors.blue, fontSize: 17, fontStyle: FontStyle.italic, decoration: TextDecoration.underline),
                //   ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      "Health History",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
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
            height: 750,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: health_history.length,
                itemBuilder: (context, index) {
                  return Health_History_List(health_history[index],context);
                }
            ),

          ),





        ],
      ),
    );
  }

  void getPatientHealthHistory() {
    health_history.clear();
    DocViewUserHistory.requestThenResponsePrint(SIGNINGRESPONSE.id).then((value){
      print(value.statusCode);
      print(value.body);

      var myvar = UserHealthHistory.fromJson(jsonDecode(value.body));
      print(myvar);

      myvar.epres.forEach((element) {
        setState(() {
          print(element.doctor.name);
          health_history.add(Health_History(
              name: element.doctor.name,lab_report_type: 'Care+ Prescription',time: DateFormat('hh:mm a').format(element.createdAt),date: DateFormat('dd MMM yyyy').format(element.createdAt), image: '$apiDomainRoot/images/${element.doctor.image.toString()}',id: element.id.toString()
          ));


        });
      });

      myvar.report.forEach((element) {
        setState(() {
          print(element.name);
          health_history.add(Health_History(
              name: element.name,lab_report_type: element.type,time: DateFormat('hh:mm a').format(element.createdAt),date: DateFormat('dd MMM yyyy').format(element.createdAt), image: '$apiDomainRoot/files/${element.file.toString()}', id: element.id.toString()
          ));


        });
      });


    });

  }
}





