import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/hospital_controller.dart';
import 'package:care_plus/data/hospital_list_data/hospital_list_data.dart';
import 'package:care_plus/helper/alertDialogue.dart';
import 'package:care_plus/models/ui_model/hospital_model/hospital_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/hospital_responses.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/ambulance_list_widget/ambulance_list_widget.dart';
import 'package:flutter/material.dart';

class HospitalList extends StatefulWidget {
  const HospitalList({Key? key}) : super(key: key);

  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  List<HospitalRes> hospitallist = [];
  bool nevigation = true;

  _getHospitalList() async {


    HospitalController.requestThenResponsePrint().then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        hospitallist =
            listNotification.map((model) => HospitalRes.fromJson(model)).toList();
        print(hospitallist);

      });
    });
  }





  @override
  void initState() {
    _getHospitalList();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Hospital List",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 10,right: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 14),
                      border: InputBorder.none,
                      hintText: "Search your doctor",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 15),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                        color: Color(0xFF1CBFA8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 780,
                    child: ListView.builder(
                      //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: hospitallist.length,
                        itemBuilder: (context,index) {
                          return AmbulanceHospitalWidget(
                              hospitallist[index].id,
                              hospitallist[index].type,
                              hospitallist[index].name,
                              hospitallist[index].description,
                              hospitallist[index].mobile,
                              hospitallist[index].address,
                              hospitallist[index].image,
                              hospitallist[index].website,
                              nevigation,
                              context,
                          );
                        }
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// int id,
//     String type,
// String hospital,
//     String about,
// String phone_number,
//     String address,

//AmbulanceHospitalWidget