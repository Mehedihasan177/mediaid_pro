import 'package:care_plus/data/doctor_list_and_details/doctorlist_and_%20details.dart';
import 'package:care_plus/data/specialist_information/getInformation.dart';
import 'package:care_plus/data/upcomming_appointment/upcomming_appointment.dart';
import 'package:care_plus/models/ui_model/doctor_informations/doctor_information_model.dart';
import 'package:care_plus/models/ui_model/specialist_information/information_model.dart';
import 'package:care_plus/models/ui_model/upcomming_appointment/upcomming_appointment_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/specialization_responses.dart';
import 'package:care_plus/views/screens/doctor_list_by_catagory/doctor_list_by_catagory.dart';
import 'package:care_plus/views/screens/featured_doctor/featured_doctor.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/find_by_specialist_widget/find_by_specialist_widget.dart';
import 'package:care_plus/views/widgets/homepage_doctor_card_widget/homepage_doctor_card_widget.dart';
import 'package:flutter/material.dart';

class DoctorsNavbar extends StatefulWidget {
  const DoctorsNavbar({Key? key}) : super(key: key);

  @override
  _DoctorsNavbarState createState() => _DoctorsNavbarState();
}

class _DoctorsNavbarState extends State<DoctorsNavbar> {
  List<SpecializationResponse> informationslist = [];
  List<DoctorINformation> allinformatonss = List.of(allinformations);
  List<UpcommingAppointment> appointment = List.of(allappointmnet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[
          Padding(
            padding: const EdgeInsets.only(top: 30),
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
          SizedBox(
            height: 10,
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
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DoctorListByCatagory()));
                  },
                  child: Text(
                    "See All",
                  ),
                ),
              ),

            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            height: 80,
            child: ListView.builder(
                controller: PageController(viewportFraction: 0.3),
                scrollDirection: Axis.horizontal,
                itemCount: informationslist.length,
                itemBuilder: (context,index) {
                  var information = informationslist[index];
                  return Findspecialist(informationslist[index], context, index);
                }
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Featured Doctors",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
          SizedBox(
            height: 20,
          ),


          Container(
            height: 500,
            // color: Colors.red,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: allinformatonss.length,
                itemBuilder: (context, index) {
                  //final item = allinformatonss[index];
                  return doctorList(allinformatonss[index], context);
                }),

          ),
        ]
      )
    );
  }
}
