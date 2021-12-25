import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
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
  TextEditingController searchC = TextEditingController();

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
        //Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(

        appBar: myAppBar("Featured Doctor", null),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [

            Center(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: searchC,
                  onChanged: onSearch,
                  onSubmitted: onSearch,
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

            //SizedBox(height: 20),
            Container(
                height: 735,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    //shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: doctorFeturedlist.length,
                    itemBuilder: (context, index) {

                      if(searchKey.length==0){
                        return buildDoctorListTile(doctorFeturedlist[index], context);
                      }else{
                        if(doctorFeturedlist[index].name.toLowerCase().contains(searchKey)){
                          return buildDoctorListTile(doctorFeturedlist[index], context);
                        }else if(doctorFeturedlist[index].specialization.toLowerCase().contains(searchKey)){
                          return buildDoctorListTile(doctorFeturedlist[index], context);
                        }else if(doctorFeturedlist[index].address.toLowerCase().contains(searchKey)){
                          return buildDoctorListTile(doctorFeturedlist[index], context);
                        }else if(doctorFeturedlist[index].bmdcReg.toLowerCase().contains(searchKey)){
                          return buildDoctorListTile(doctorFeturedlist[index], context);
                        }else if(doctorFeturedlist[index].chambers.toLowerCase().contains(searchKey)){
                          return buildDoctorListTile(doctorFeturedlist[index], context);
                        }else if(doctorFeturedlist[index].department.toLowerCase().contains(searchKey)){
                          return buildDoctorListTile(doctorFeturedlist[index], context);
                        }else if(doctorFeturedlist[index].hospitalName.toLowerCase().contains(searchKey)){
                          return buildDoctorListTile(doctorFeturedlist[index], context);
                        }else if(doctorFeturedlist[index].degree.toLowerCase().contains(searchKey)){
                          return buildDoctorListTile(doctorFeturedlist[index], context);
                        }else if(doctorFeturedlist[index].introduction.toLowerCase().contains(searchKey)){
                          return buildDoctorListTile(doctorFeturedlist[index], context);
                        }else if(doctorFeturedlist[index].visitingFee.toLowerCase().contains(searchKey)){
                          return buildDoctorListTile(doctorFeturedlist[index], context);
                        }else if(doctorFeturedlist[index].district.toLowerCase().contains(searchKey)){
                          return buildDoctorListTile(doctorFeturedlist[index], context);
                        }else{
                          return Container();
                        }
                      }


                    }),
              ),


          ],
        ),
      ),
    );
  }
  String searchKey = '';
  void onSearch(String value) {
    setState(() {
      searchKey=value;
    });
  }
}
