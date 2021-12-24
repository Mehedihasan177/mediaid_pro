import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/get_type_doctor_controller.dart';
import 'package:care_plus/data/doctor_list_and_details/doctorlist_and_%20details.dart';
import 'package:care_plus/models/ui_model/doctor_informations/doctor_information_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/doctor_list_responses.dart';
import 'package:care_plus/responses_from_test_file/responses/user/featured_doctor_responses.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/featured_doctor_widget.dart';
import 'package:care_plus/views/widgets/homepage_doctor_card_widget/homepage_doctor_card_widget.dart';
import 'package:flutter/material.dart';

class FeaturedDoctor extends StatefulWidget {
  const FeaturedDoctor({Key? key}) : super(key: key);

  @override
  _FeaturedDoctorState createState() => _FeaturedDoctorState();
}

class _FeaturedDoctorState extends State<FeaturedDoctor> {

  List<FeaturedDoctorrr> doctorFeturedlist = [];


  _getFeturedDoctor() async {



    GetFeaturedDoctorController.requestThenResponsePrint(USERTOKEN).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        doctorFeturedlist =
            listNotification.map((model) => FeaturedDoctorrr.fromJson(model)).toList();
        print(doctorFeturedlist);

      });
    });
  }


  @override
  void initState() {
    _getFeturedDoctor();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
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
                        "Featured Doctor",
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

            Center(
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 10, top: 30),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 14),
                    border: InputBorder.none,
                    hintText: "Search doctor catagory",
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

            SizedBox(height: 20),

            Container(
                height: 680,
                //color: Colors.red,
                child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: doctorFeturedlist.length,    //doctorFeturedlist.length
                    itemBuilder: (BuildContext context, int index) {
                      return buildDoctorListTile(doctorFeturedlist[index], context);
                    }
                )
            ),
          ],
        ),
      ),
    );
  }
}
