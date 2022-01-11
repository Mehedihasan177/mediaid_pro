import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/no_data_found.dart';
import 'package:care_plus/constents/shimmer.dart';
import 'package:care_plus/controllers/user/doctorList_controller.dart';
import 'package:care_plus/controllers/user/get_type_doctor_controller.dart';
import 'package:care_plus/controllers/user/upcoming_appointment_controller.dart';
import 'package:care_plus/data/near_by/near_by.dart';
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
import 'package:care_plus/responses_from_test_file/responses/user/featured_doctor_responses.dart';
import 'package:care_plus/responses_from_test_file/responses/user/specialization_responses.dart';
import 'package:care_plus/responses_from_test_file/responses/user/upcoming_appointment_list_responses.dart';
import 'package:care_plus/services/call_check_service.dart';
import 'package:care_plus/services/firebase_services.dart';
import 'package:care_plus/views/screens/doctor_catagory/doctor_catagory_page.dart';
import 'package:care_plus/views/screens/featured_doctor/featured_doctor.dart';
import 'package:care_plus/views/screens/notificaitonUi/notificaitonUi.dart';
import 'package:care_plus/views/screens/signInPage/sign_in_page.dart';
import 'package:care_plus/views/screens/splash_screen/splash_Screen.dart';
import 'package:care_plus/views/widgets/featured_doctor_widget.dart';
import 'package:care_plus/views/widgets/find_by_specialist_widget/find_by_specialist_widget.dart';
import 'package:care_plus/views/widgets/homepage_doctor_card_widget/homepage_doctor_card_widget.dart';
import 'package:care_plus/views/widgets/homepage_upcomming_appointment_widget/upcomming_appointment_widget.dart';
import 'package:care_plus/views/widgets/nearby_ambulance_hospital_widget/nearby_ambulance_hospital_widget.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_database/firebase_database.dart';
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
  List<UpcomingAppointment> appointment = [];
  List<NearBy> nearby = List.of(near_by_hospital_ambulance);
  int _index = 0;
  List<SpecializationResponse> informationslist = [];
  List<FeaturedDoctorrr> doctorFeturedlist = [];
  TextEditingController _textSearch = TextEditingController();
  int val = 0;
  int val1 = 0;

  bool image = false;

  _getUpcomingAppointment() async {


    UpcomingAppointmentController.requestThenResponsePrint( USERTOKEN).then((value) {
      setState(() {
        val = 1;
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        appointment =
            listNotification.map((model) => UpcomingAppointment.fromJson(model)).toList();
        print(appointment);

      });
    });
  }


  _getFeturedDoctor() async {



    GetFeaturedDoctorController.requestThenResponsePrint(USERTOKEN).then((value) {
      setState(() {
        val1 = 1;
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
  _getDoctorSpecialization() async {
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


    _getDoctorSpecialization();
    _getFeturedDoctor();
    _getUpcomingAppointment();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(

      onWillPop: () async {

        return true;
      },
      child: Scaffold(
          body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
              content: Text('Tap back again to leave'),
            ),
            child: ListView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(

                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: image == true ? NetworkImage(avatarLink) : NetworkImage(
                                  '$apiDomainRoot/images/${SIGNINGRESPONSE.image}'
                              ),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text(
                                    "Hello, ${SIGNINGRESPONSE.name}",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  IconButton(
                                    icon: ImageIcon(
                                      AssetImage("images/notification.png"),
                                      color: Color(0xFF1CBFA8),
                                    ),
                                    iconSize: 28,
                                    onPressed: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => NotificationPage()));
                                    },
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 17),
                              child: Row(children: [
                                Image(
                                  height: 15,
                                  width: 15,
                                  image: AssetImage("images/location.png"),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "${SIGNINGRESPONSE.address}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
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
                    controller: _textSearch,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    onSubmitted: onNevigation,
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
                    padding: EdgeInsets.only(left: 10),
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
                          Navigator.push(
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
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                height: 130,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
              ///ambulance and hospital list


              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.only(left: 10),
                height: 125,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: nearby.length,
                  itemBuilder: (context, index) {
                  return Nearby_ambulance_hospital(nearby[index], context);
                },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Upcoming Appointments", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(
                height: 10,
              ),
                val == 0 ? shimmerOneLine(context) : Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 120,
                  // color: Colors.red,
                  child: appointment.isEmpty ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("images/appointment_history.png",
                            height: 50,
                            width: 50,
                          ),
                          Text("No Appointment found",
                            style: TextStyle(fontSize: 12, color: Color(0xFF1CBFA8)),

                          ),
                        ],
                      )
                    //NoDataFound("images/find_doctor.png", "No Doctor Found"),
                  ) :ListView.builder(
                    shrinkWrap: true,
                      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                      padding: EdgeInsets.only(left: 10),
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
                        Navigator.push(context,MaterialPageRoute(builder: (context) => FeaturedDoctor(text: '',)));
                      },
                      child: Text(
                        "See All",
                      ),
                    ),
                  ),
                ],
              ),

                val1 == 0 ? shimmerThreeLine(context) : Container(
                // height: 300,
                  child: doctorFeturedlist.isEmpty ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("images/find_doctor.png",
                        height: 60,
                          width: 60,
                        ),
                        Text("No Doctor Found",
                        style: TextStyle(fontSize: 15, color: Color(0xFF1CBFA8)),

                        ),
                      ],
                    )
                    //NoDataFound("images/find_doctor.png", "No Doctor Found"),
                  ) : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: doctorFeturedlist.length,    //doctorFeturedlist.length
                      itemBuilder: (BuildContext context, int index) {
                        return index<3? buildDoctorListTile(doctorFeturedlist[index], context):Container();
                      }
                  )
              ),

              StreamBuilder(
                stream: FirebaseDatabase().reference().child('callModule').child("Patient").child('${SIGNINGRESPONSE.id}').onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  print(snapshot.data?.snapshot.value.toString());
                  if(snapshot.hasData && !snapshot.hasError &&
                      snapshot.data?.snapshot.value != null){
                    print('prev $gone');
                    if(gone==0)goForCallorNot(SIGNINGRESPONSE.id.toString(),context);
                    gone=1;
                    print('next $gone');

                    return const Text('');
                  }else{
                    return (const Text(''));
                  }
                },
              ),


            ],
              shrinkWrap: true,
            ),
          ),

        ),

    );
  }

  void onNevigation(String value) {
    setState(() {
      Navigator.push(context,MaterialPageRoute(builder: (context) => FeaturedDoctor(text: _textSearch.text)));
    });
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