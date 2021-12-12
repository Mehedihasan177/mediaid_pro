import 'package:care_plus/data/hospital_list_data/hospital_list_data.dart';
import 'package:care_plus/models/ui_model/hospital_model/hospital_model.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/ambulance_list_widget/ambulance_list_widget.dart';
import 'package:flutter/material.dart';

class HospitalList extends StatefulWidget {
  const HospitalList({Key? key}) : super(key: key);

  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  List<HospitalModel> hospitallist = List.of(hospitalList);
  bool nevigation = true;
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
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    alignment: Alignment.centerLeft,
                    height: 750,
                    child: ListView.builder(
                      //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: hospitallist.length,
                        itemBuilder: (context,index) {
                          return AmbulanceHospitalWidget(
                            hospitallist[index].id,
                            hospitallist[index].name,
                            hospitallist[index].hospital,
                            hospitallist[index].about,
                            hospitallist[index].phone_number,
                            hospitallist[index].address,
                            hospitallist[index].image,
                            hospitallist[index].website,
                            hospitallist[index].latitude,
                            hospitallist[index].longtitude,
                              nevigation,
                              context
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
