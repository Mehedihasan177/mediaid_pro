import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/doctorList_controller.dart';
import 'package:care_plus/data/doctor_list_by_catagory_data/doctor_list_by_catagory_data.dart';
import 'package:care_plus/models/ui_model/doctor_list_by_catagory_model/doctor_list_by_catagory_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/doctor_list_responses.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/doctor_list_by_catagory_widget/doctor_list_by_catagory_widget.dart';
import 'package:care_plus/views/widgets/homepage_doctor_card_widget/homepage_doctor_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorListByCatagory extends StatefulWidget {

  final String name;

  const DoctorListByCatagory({Key? key,required this.name}) : super(key: key);

  @override
  _DoctorListByCatagoryState createState() => _DoctorListByCatagoryState();
}

class _DoctorListByCatagoryState extends State<DoctorListByCatagory> {
  // List<DoctorListByCatagorymodel> doctorlistbycatagory = List.of(doctor_list_by_catagory_data);


  List<Datum> doctorlistbycatagory = [];


  _getDoctorListByCatagory() async {


    DoctorListController.requestThenResponsePrint(USERTOKEN,widget.name).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        doctorlistbycatagory =
            listNotification.map((model) => Datum.fromJson(model)).toList();
        print(doctorlistbycatagory);

      });
    });
  }

  @override
  void initState() {
    _getDoctorListByCatagory();
    super.initState();
  }

  TextEditingController searchC = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return WillPopScope(

      onWillPop: () async {
        //Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Find Best ${widget.name}'),
          backgroundColor: Color(0xff1CBFA8),
        ),
        body: ListView(
          children: [

            Center(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 30),
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
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                height: 900,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: doctorlistbycatagory.length,
                    itemBuilder: (context, index) {

                      if(searchKey.length==0){
                        return doctorList(doctorlistbycatagory[index], context);
                      }else{
                        if(doctorlistbycatagory[index].name.toLowerCase().contains(searchKey)){
                          return doctorList(doctorlistbycatagory[index], context);
                        }else if(doctorlistbycatagory[index].specialization.toLowerCase().contains(searchKey)){
                          return doctorList(doctorlistbycatagory[index], context);
                        }else if(doctorlistbycatagory[index].address.toLowerCase().contains(searchKey)){
                          return doctorList(doctorlistbycatagory[index], context);
                        }else if(doctorlistbycatagory[index].bmdcReg.toLowerCase().contains(searchKey)){
                          return doctorList(doctorlistbycatagory[index], context);
                        }else if(doctorlistbycatagory[index].chambers.toLowerCase().contains(searchKey)){
                          return doctorList(doctorlistbycatagory[index], context);
                        }else if(doctorlistbycatagory[index].department.toLowerCase().contains(searchKey)){
                          return doctorList(doctorlistbycatagory[index], context);
                        }else if(doctorlistbycatagory[index].hospitalName.toLowerCase().contains(searchKey)){
                          return doctorList(doctorlistbycatagory[index], context);
                        }else if(doctorlistbycatagory[index].degree.toLowerCase().contains(searchKey)){
                          return doctorList(doctorlistbycatagory[index], context);
                        }else if(doctorlistbycatagory[index].introduction.toLowerCase().contains(searchKey)){
                          return doctorList(doctorlistbycatagory[index], context);
                        }else if(doctorlistbycatagory[index].visitingFee.toLowerCase().contains(searchKey)){
                          return doctorList(doctorlistbycatagory[index], context);
                        }else if(doctorlistbycatagory[index].district.toLowerCase().contains(searchKey)){
                          return doctorList(doctorlistbycatagory[index], context);
                        }else{
                          return Container();
                        }
                      }

                      return doctorList(doctorlistbycatagory[index], context);
                    }),
              ),
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
