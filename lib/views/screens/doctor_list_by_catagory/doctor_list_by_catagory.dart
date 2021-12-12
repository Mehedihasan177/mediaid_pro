import 'package:care_plus/data/doctor_list_by_catagory_data/doctor_list_by_catagory_data.dart';
import 'package:care_plus/models/ui_model/doctor_list_by_catagory_model/doctor_list_by_catagory_model.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/doctor_list_by_catagory_widget/doctor_list_by_catagory_widget.dart';
import 'package:flutter/material.dart';

class DoctorListByCatagory extends StatefulWidget {
  const DoctorListByCatagory({Key? key}) : super(key: key);

  @override
  _DoctorListByCatagoryState createState() => _DoctorListByCatagoryState();
}

class _DoctorListByCatagoryState extends State<DoctorListByCatagory> {
  List<DoctorListByCatagorymodel> doctorlistbycatagory = List.of(doctor_list_by_catagory_data);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
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
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Text(
                        "Doctor List By Catagory",
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
                margin: EdgeInsets.only(left: 10, right: 10, top: 30),
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
                height: 700,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: doctorlistbycatagory.length,
                    itemBuilder: (context, index) {
                      return DoctorListByCatagoryWidget(
                          doctorlistbycatagory[index], context);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
