import 'dart:async';

import 'package:care_plus/views/screens/appointment_booked_successfully/appointment_booked_successfully.dart';
import 'package:care_plus/views/screens/care_plus_lab_report_list/care_plus_lab_report_list.dart';
import 'package:care_plus/views/screens/care_plus_prescriptions_list/care_plus_prescriptions_list.dart';
import 'package:care_plus/views/screens/change_password/change_password.dart';
import 'package:care_plus/views/screens/confirm_appointment/confirm_appointment.dart';
import 'package:care_plus/views/screens/doctor_appointment_pages/doctor_about_and_appointment_page.dart';
import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/reset_Password/reset_Password.dart';
import 'package:care_plus/views/screens/setUp_Profile/setUp_Profile.dart';
import 'package:care_plus/views/screens/signInPage/sign_in_page.dart';
import 'package:care_plus/views/screens/sing_up_page/sign_up_page.dart';
import 'package:care_plus/views/screens/update_profile/update_profile.dart';
import 'package:care_plus/views/screens/upload_documents/upload_documents.dart';
import 'package:care_plus/views/screens/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../intro_screens.dart';
// import 'package:havartye/screen/home_page.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key,}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String finalMobile = '';
  late String finalPassword = '';
  var obtainedMobile;
  var obtainedPassword;
  @override
  void initState() {
    // TODO: implement initState
    getValidationData().whenComplete(() async {
      Timer(
          Duration(seconds: 3),
              () =>Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => finalMobile == null && finalPassword == null
              ? OnBoardingPage()
              : SingInPage())));


    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    obtainedMobile = sharedPreferences.getString("mobile");
    obtainedPassword = sharedPreferences.getString("password");

    setState(() {
      finalMobile = obtainedMobile;
      finalPassword = obtainedPassword;
    });
    print(finalMobile);
    print(finalPassword);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          // new Center(
          //   child: new Text("Hello background", style: TextStyle(color: Colors.white,fontSize: 20),),
          // ),
          Center(
            child: Container(
              child: Image(image: AssetImage("images/medipro_video.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
