import 'package:care_plus/data/health_history/health_history_data.dart';
import 'package:care_plus/models/ui_model/health_histoy/health_history_model.dart';
import 'package:care_plus/views/screens/care_plus_lab_report_list/care_plus_lab_report_list.dart';
import 'package:care_plus/views/screens/care_plus_prescriptions_list/care_plus_prescriptions_list.dart';
import 'package:care_plus/views/screens/upload_documents/upload_documents.dart';
import 'package:care_plus/views/widgets/health_history_ui_widget/health_history_widget_widget.dart';
import 'package:flutter/material.dart';

class HealthHistory extends StatefulWidget {
  const HealthHistory({Key? key}) : super(key: key);

  @override
  _HealthHistoryState createState() => _HealthHistoryState();
}

class _HealthHistoryState extends State<HealthHistory> {
  List<Health_History> health_history = List.of(healthHistory);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(

                    child: Text(
                      "Upload Reports",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () async {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => UploadDocument()));

                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 45),
                      maximumSize: const Size(100, 45),
                      primary: Color(0xFF1CBFA8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //   //color: Color(0xF60D72),
                  //     borderRadius: BorderRadius.circular(18)),
                ),
                SizedBox(width: 30,),
                Expanded(
                  // height: MediaQuery.of(context).size.height * 0.07,
                  // width: MediaQuery.of(context).size.width * 0.9,
                  //color: Color(0xF60D72),
                  child: ElevatedButton(

                    child: Text(
                      "Explore Lab Reports",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () async {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => CarePlusLabReportList()));

                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 45),
                      maximumSize: const Size(100, 45),
                      primary: Color(0xFF1CBFA8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //   //color: Color(0xF60D72),
                  //     borderRadius: BorderRadius.circular(18)),
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
                      child: Health_History_List(health_history[index]));
                }),

          ),
        ],
      ),
    );
  }
}


