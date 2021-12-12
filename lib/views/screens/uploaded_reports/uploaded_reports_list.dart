import 'package:care_plus/data/uploaded_reports_data/uploaded_reports_data.dart';
import 'package:care_plus/models/uploaded_reports_model/uploaded_reports_model.dart';
import 'package:care_plus/views/screens/appointments_pages/appointmnet_list/appointment_list_ui.dart';
import 'package:care_plus/views/widgets/uploaded_reports_list_widget/uploaded_reports_list_widget.dart';
import 'package:flutter/material.dart';

class UploadedReports extends StatefulWidget {
  const UploadedReports({Key? key}) : super(key: key);

  @override
  _UploadedReportsState createState() => _UploadedReportsState();
}

class _UploadedReportsState extends State<UploadedReports> {
  List<UploadedReportsmodel> uploadedReportList = List.of(uploadedReportsData);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AppointmentList()));
        return true;
      },
      child: Scaffold(
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                FlatButton(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AppointmentList()));
                  },
                ),
                Text("Uploaded Report List",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(left: 2),
                  alignment: Alignment.centerLeft,
                  height: 750,
                  child: ListView.builder(
                    //controller: PageController(viewportFraction: 0.3),
                      scrollDirection: Axis.vertical,
                      itemCount: uploadedReportList.length,
                      itemBuilder: (context,index) {
                        //var information = carePlushPrescriptionList[index];
                        return UploadedReportWidget(uploadedReportList[index]);

                      }
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

