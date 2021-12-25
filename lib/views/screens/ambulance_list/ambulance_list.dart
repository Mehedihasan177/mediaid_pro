import 'dart:convert';

import 'package:care_plus/controllers/user/ambulanceList_controller.dart';
import 'package:care_plus/data/ambulance_list_data/ambulance_list_data.dart';
import 'package:care_plus/data/hospital_list_data/hospital_list_data.dart';
import 'package:care_plus/models/ui_model/ambulance_model/ambulance_model.dart';
import 'package:care_plus/models/ui_model/hospital_model/hospital_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/ambulance_responses.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/ambulance_list_widget/ambulance_list_widget.dart';
import 'package:flutter/material.dart';


class AmbulanceList extends StatefulWidget {
  const AmbulanceList({Key? key}) : super(key: key);

  @override
  _AmbulanceListState createState() => _AmbulanceListState();
}

class _AmbulanceListState extends State<AmbulanceList> {
  List<AmbulanceRes> ambulancelist = [];

  TextEditingController searchC = TextEditingController();
  _getAmbulanceList() async {


    AmbulanceListController.requestThenResponsePrint().then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        ambulancelist =
            listNotification.map((model) => AmbulanceRes.fromJson(model)).toList();
        print(ambulancelist);

      });
    });
  }





  @override
  void initState() {
    _getAmbulanceList();
    // TODO: implement initState
    super.initState();
  }



  bool nevigation = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        //Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Ambulance List', style: TextStyle(
            color: Colors.black
        ),

        ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  // height: 55,
                  margin: EdgeInsets.only(left: 10,right: 10),
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
                      hintText: "Search your ambulance",
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
            SizedBox(height: 5),
            // Row(
            //   children: [
            //     Flexible(
            //       child: Container(
            //         padding: EdgeInsets.only(left: 5, right: 5),
            //         alignment: Alignment.centerLeft,
            //         height: 700,
            //         child: ListView.builder(
            //           //controller: PageController(viewportFraction: 0.3),
            //             scrollDirection: Axis.vertical,
            //             itemCount: ambulancelist.length,
            //             itemBuilder: (context,index) {
            //               return AmbulanceHospitalWidget(
            //                   ambulancelist[index].id,
            //                   ambulancelist[index].hospital.name,
            //                   ambulancelist[index].name,
            //                   ambulancelist[index].hospital.description,
            //                   ambulancelist[index].hospital.address,
            //                   ambulancelist[index].hospital.mobile,
            //                   ambulancelist[index].hospital.image,
            //                   ambulancelist[index].hospital.website,
            //                   nevigation,
            //                 context
            //               );
            //             // String id,
            //               //         String type,
            //               //         String hospital,
            //               //         String about,
            //               //         String phone_number,
            //               //         String address,
            //               //         String image,
            //               //         String website,
            //               //
            //               //         bool nevigation,
            //               //         BuildContext context
            //             }
            //         ),
            //       ),
            //     ),
            //   ],
            // ),


            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                height: 900,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: ambulancelist.length,
                    itemBuilder: (context, index) {

                      if(searchKey.length==0){
                        return AmbulanceHospitalWidget(
                            ambulancelist[index].id,
                            ambulancelist[index].hospital.name,
                            ambulancelist[index].name,
                            ambulancelist[index].hospital.description,
                            ambulancelist[index].hospital.address,
                            ambulancelist[index].hospital.mobile,
                            ambulancelist[index].hospital.image,
                            ambulancelist[index].hospital.website,
                            nevigation,
                            context
                        );
                      }else{
                        if(ambulancelist[index].name.toLowerCase().contains(searchKey)){
                          return  AmbulanceHospitalWidget(
                              ambulancelist[index].id,
                              ambulancelist[index].hospital.name,
                              ambulancelist[index].name,
                              ambulancelist[index].hospital.description,
                              ambulancelist[index].hospital.address,
                              ambulancelist[index].hospital.mobile,
                              ambulancelist[index].hospital.image,
                              ambulancelist[index].hospital.website,
                              nevigation,
                              context
                          );
                        }else if(ambulancelist[index].id.toLowerCase().contains(searchKey)){
                          return  AmbulanceHospitalWidget(
                              ambulancelist[index].id,
                              ambulancelist[index].hospital.name,
                              ambulancelist[index].name,
                              ambulancelist[index].hospital.description,
                              ambulancelist[index].hospital.address,
                              ambulancelist[index].hospital.mobile,
                              ambulancelist[index].hospital.image,
                              ambulancelist[index].hospital.website,
                              nevigation,
                              context
                          );
                        }else if(ambulancelist[index].hospital.name.toLowerCase().contains(searchKey)){
                          return AmbulanceHospitalWidget(
                              ambulancelist[index].id,
                              ambulancelist[index].hospital.name,
                              ambulancelist[index].name,
                              ambulancelist[index].hospital.description,
                              ambulancelist[index].hospital.address,
                              ambulancelist[index].hospital.mobile,
                              ambulancelist[index].hospital.image,
                              ambulancelist[index].hospital.website,
                              nevigation,
                              context
                          );}else if(ambulancelist[index].name.toLowerCase().contains(searchKey)){
                          return AmbulanceHospitalWidget(
                              ambulancelist[index].id,
                              ambulancelist[index].hospital.name,
                              ambulancelist[index].name,
                              ambulancelist[index].hospital.description,
                              ambulancelist[index].hospital.address,
                              ambulancelist[index].hospital.mobile,
                              ambulancelist[index].hospital.image,
                              ambulancelist[index].hospital.website,
                              nevigation,
                              context
                          );}else if(ambulancelist[index].hospital.description.toLowerCase().contains(searchKey)){
                          return AmbulanceHospitalWidget(
                              ambulancelist[index].id,
                              ambulancelist[index].hospital.name,
                              ambulancelist[index].name,
                              ambulancelist[index].hospital.description,
                              ambulancelist[index].hospital.address,
                              ambulancelist[index].hospital.mobile,
                              ambulancelist[index].hospital.image,
                              ambulancelist[index].hospital.website,
                              nevigation,
                              context
                          );                        }else if(ambulancelist[index].hospital.address.toLowerCase().contains(searchKey)){
                          return AmbulanceHospitalWidget(
                              ambulancelist[index].id,
                              ambulancelist[index].hospital.name,
                              ambulancelist[index].name,
                              ambulancelist[index].hospital.description,
                              ambulancelist[index].hospital.address,
                              ambulancelist[index].hospital.mobile,
                              ambulancelist[index].hospital.image,
                              ambulancelist[index].hospital.website,
                              nevigation,
                              context
                          );                        }else if(ambulancelist[index].hospital.mobile.toLowerCase().contains(searchKey)){
                          return AmbulanceHospitalWidget(
                              ambulancelist[index].id,
                              ambulancelist[index].hospital.name,
                              ambulancelist[index].name,
                              ambulancelist[index].hospital.description,
                              ambulancelist[index].hospital.address,
                              ambulancelist[index].hospital.mobile,
                              ambulancelist[index].hospital.image,
                              ambulancelist[index].hospital.website,
                              nevigation,
                              context
                          );                        }else if(ambulancelist[index].hospital.image.toLowerCase().contains(searchKey)){
                          return AmbulanceHospitalWidget(
                              ambulancelist[index].id,
                              ambulancelist[index].hospital.name,
                              ambulancelist[index].name,
                              ambulancelist[index].hospital.description,
                              ambulancelist[index].hospital.address,
                              ambulancelist[index].hospital.mobile,
                              ambulancelist[index].hospital.image,
                              ambulancelist[index].hospital.website,
                              nevigation,
                              context
                          );                        }else if(ambulancelist[index].hospital.website.toLowerCase().contains(searchKey)){
                          return AmbulanceHospitalWidget(
                              ambulancelist[index].id,
                              ambulancelist[index].hospital.name,
                              ambulancelist[index].name,
                              ambulancelist[index].hospital.description,
                              ambulancelist[index].hospital.address,
                              ambulancelist[index].hospital.mobile,
                              ambulancelist[index].hospital.image,
                              ambulancelist[index].hospital.website,
                              nevigation,
                              context
                          );                        }else{
                          return Container();
                        }

                      }


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





