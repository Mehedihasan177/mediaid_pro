import 'package:care_plus/data/care_plus_lab_report_list_data/care_plus_lab_report_list_data.dart';
import 'package:care_plus/models/ui_model/care_plus_lab_report_list_model/care_plus_lab_report_list_model.dart';
import 'package:care_plus/views/screens/appointments_pages/appointmnet_list/appointment_list_ui.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/care_plus_lab_report_list_Widget/care_plus_lab_report_list_widget.dart';
import 'package:flutter/material.dart';

class CarePlusLabReportList extends StatefulWidget {
  const CarePlusLabReportList({Key? key}) : super(key: key);

  @override
  _CarePlusLabReportListState createState() => _CarePlusLabReportListState();
}

class _CarePlusLabReportListState extends State<CarePlusLabReportList> {
  List<CarePlusLabReportListModel> carePlushLabReportList = List.of(care_plus_lab_report_list_data);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
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
                Text("Care+ Lab Report List",
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
                  padding: EdgeInsets.only(left: 5),
                  alignment: Alignment.centerLeft,
                  height: 750,
                  child: ListView.builder(
                    //controller: PageController(viewportFraction: 0.3),
                      scrollDirection: Axis.vertical,
                      itemCount: carePlushLabReportList.length,
                      itemBuilder: (context,index) {
                        //var information = carePlushPrescriptionList[index];
                        return CarePlusLabReportWidget(carePlushLabReportList[index]);

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


