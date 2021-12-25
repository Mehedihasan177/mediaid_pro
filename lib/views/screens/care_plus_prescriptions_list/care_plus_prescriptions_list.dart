import 'package:care_plus/data/care_plus_prescriptions_list_data/care_plus_prescriptions_list_data.dart';
import 'package:care_plus/models/ui_model/care_plus_prescriptions_list_model/care_plus_prescriptions_list_model.dart';
import 'package:care_plus/views/screens/appointments_pages/appointmnet_list/appointment_list_ui.dart';
import 'package:care_plus/views/screens/health_history_ui/health_histoy_ui.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/care_plus_prescriptions_list_widget/care_plus_prescriptions_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarePlusPrescriptionsList extends StatefulWidget {
  const CarePlusPrescriptionsList({Key? key}) : super(key: key);

  @override
  _CarePlusPrescriptionsListState createState() =>
      _CarePlusPrescriptionsListState();
}

class _CarePlusPrescriptionsListState extends State<CarePlusPrescriptionsList> {
  List<CarePlusPrescriptionListModel> carePlushPrescriptionList = List.of(care_plus_prescriptions_list_data);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.push(context,MaterialPageRoute(builder: (context) => AppointmentList()));
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
                    Navigator.push(context,MaterialPageRoute(builder: (context) => AppointmentList()));
                  },
                ),
                Text("Care+ Prescriptions List",
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
                      itemCount: carePlushPrescriptionList.length,
                      itemBuilder: (context,index) {
                        //var information = carePlushPrescriptionList[index];
                        return CarePlusPrescriptionWidget(carePlushPrescriptionList[index]);

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


