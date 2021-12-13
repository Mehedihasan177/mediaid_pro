import 'dart:convert';

import 'package:care_plus/data/near_by/near_by.dart';
import 'package:care_plus/helper/alertDialogue.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/ui_model/doctor_informations/doctor_information_model.dart';
import 'package:care_plus/data/doctor_list_and_details/doctorlist_and_%20details.dart';
import 'package:care_plus/data/specialist_information/getInformation.dart';
import 'package:care_plus/models/ui_model/near_by_ambulance_and_hospital/near_by_ambulance_and_hospital.dart';
import 'package:care_plus/models/ui_model/specialist_information/information_model.dart';
import 'package:care_plus/data/upcomming_appointment/upcomming_appointment.dart';
import 'package:care_plus/models/ui_model/upcomming_appointment/upcomming_appointment_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/doctor_list_responses.dart';
import 'package:care_plus/responses_from_test_file/responses/user/doctor_specialization_controller.dart';
import 'package:care_plus/responses_from_test_file/responses/user/specialization_responses.dart';
import 'package:care_plus/views/screens/doctor_catagory/doctor_catagory_page.dart';
import 'package:care_plus/views/screens/featured_doctor/featured_doctor.dart';
import 'package:care_plus/views/screens/notificaitonUi/notificaitonUi.dart';
import 'package:care_plus/views/widgets/find_by_specialist_widget/find_by_specialist_widget.dart';
import 'package:care_plus/views/widgets/homepage_doctor_card_widget/homepage_doctor_card_widget.dart';
import 'package:care_plus/views/widgets/homepage_upcomming_appointment_widget/upcomming_appointment_widget.dart';
import 'package:care_plus/views/widgets/nearby_ambulance_hospital_widget/nearby_ambulance_hospital_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List informations = GetInformation.infomations;
  // List<DoctorINformation> doctorInformation = List.of(allinformations);
  List<Datum> doctorInformation = [];
  // List<Diseasesinformation> informationslist = List.of(GetInformation);
  List<UpcommingAppointment> appointment = List.of(allappointmnet);
  List<NearBy> nearby = List.of(near_by_hospital_ambulance);
  int _index = 0;
  List<SpecializationResponse> informationslist = [];


  _getNotification() async {
    DoctorSpecializationController.requestThenResponsePrint().then((response) async {
      if (response.statusCode == 200) {
        print("successfully done");
        print(response);
        print(response.body);
        setState(() {
          informationslist = (json.decode(response.body.toString()) as List).map(
                  (jsonElement) => SpecializationResponse.fromJson(jsonElement)).toList();
        });
      }else{
        SnackbarDialogueHelper().showSnackbarDialog(context, 'No Data Found',Colors.red);
      }
    }
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    _getNotification();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Image(
                  height: 25,
                  width: 25,
                  image: AssetImage("images/location.png"),
                ),
                SizedBox(width: 20),
                Text(
                  "Canberra",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ]),
              IconButton(
                icon: ImageIcon(
                  AssetImage("images/notification.png"),
                  color: Color(0xFF1CBFA8),
                ),
                iconSize: 28,
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NotificationPage()));
                },
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 17),
          child: Text(
            "Hello, H. Rodney Withers",
            style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 17),
          child: Text(
            "Find Your Doctors",
            style: TextStyle(
                fontSize: 22,
                color: Colors.black.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
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

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Find by Specialist",
                style: TextStyle(fontSize: 17),
              ),
            ),

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: FlatButton(
                  minWidth: 10,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => DoctorCatagory(informationslist: informationslist,)));
                  },
                  child: Text(
                    "See All",
                  ),
                ),
              ),

          ],
        ),

        Container(
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          height: 105,
          child: ListView.builder(
            //controller: PageController(viewportFraction: 0.3),
              scrollDirection: Axis.horizontal,
              itemCount: informationslist.length,
              itemBuilder: (context,index) {
                return Findspecialist(informationslist[index], context, index);

              }
          ),
        ),

        // Container(
        //     child: ListView.builder(
        //         itemCount: informationslist.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return Findspecialist(
        //               informationslist[index], context, index);
        //         }
        //     )
        // ),


        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.only(left: 20),
          height: 125,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: nearby.length,
            itemBuilder: (context, index) {
            return Nearby_ambulance_hospital(nearby[index], context);
          },
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text("Upcomming Appointment", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            height: 120,
            // color: Colors.red,
            child: ListView.builder(
              shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: appointment.length,
                itemBuilder: (context, index) {
                  return upcommingAppointment(appointment[index], context);
                }),

          ),
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Featured Doctors",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: FlatButton(
                minWidth: 10,
                onPressed: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => FeaturedDoctor()));
                },
                child: Text(
                  "See All",
                ),
              ),
            ),
          ],
        ),

       Container(
            // height: 200,
            // color: Colors.red,
            child: ListView.builder(
                  // scrollDirection: Axis.vertical,
                  itemCount: doctorInformation.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return doctorList(doctorInformation[index], context);
                  }),

          ),


      ],
        shrinkWrap: true,
      ),

    );
  }


}
























// List pages = [['Animals',Animals()],['Birds',Birds()],['Body Parts',BodyParts()],
//   ['Country',Country()],['Fish',Fish()],['Vehicle',Vehicle()],
//   ['Plants',Plants()],['Works',Works()]];



// GestureDetector(
// child: ListTile(title:Text(pages[index][0])),
// onTap: () {
// Navigator.push(context,MaterialpageRoute(builder:(context)=>pages[index][1])));
// },
//
// );