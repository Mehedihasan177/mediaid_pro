import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:care_plus/views/screens/appointments_pages/appointmnet_list/appointment_list_ui.dart';
import 'package:care_plus/views/screens/doctor_navbar/doctor_navbar.dart';
import 'package:care_plus/views/screens/health_history_ui/health_histoy_ui.dart';
import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BottomNevigation extends StatefulWidget {


  @override
  _BottomNevigationState createState() => _BottomNevigationState();
}

class _BottomNevigationState extends State<BottomNevigation> {
  int cindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:buildpages(),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: cindex,
          containerHeight: 50,
          onItemSelected: (index) => setState(() => cindex = index),
          items: [
            BottomNavyBarItem(
                title: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text('Home', style: TextStyle(color: Color(0xFF1CBFA8)),),
                ),
                icon: Container(
                    height: 20,
                    width: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Icon(Icons.home,),
                    )),
                textAlign: TextAlign.center,
                activeColor: Color(0xFF1CBFA8),
                inactiveColor:Color(0xFF1CBFA8)
            ),
            BottomNavyBarItem(
                title: Text('Doctors', style: TextStyle(color: Color(0xFF1CBFA8)),),
                icon: Container(
                    height: 28,
                    width: 28,
                    child: Image.asset("images/doctorIcon.png")),
                textAlign: TextAlign.center,
                activeColor: Color(0xFF1CBFA8),
                inactiveColor:Color(0xFF1CBFA8)

            ),
            BottomNavyBarItem(
                title: Text('Appointment List', style: TextStyle(color: Color(0xFF1CBFA8)),),
                icon: Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("images/appointment_list.png")),
                textAlign: TextAlign.center,
                activeColor: Color(0xFF1CBFA8),
                inactiveColor:Color(0xFF1CBFA8)

            ),
            BottomNavyBarItem(
                title: Text('Health History', style: TextStyle(color: Color(0xFF1CBFA8)),),
                icon: Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("images/health_history_navbar.png")),
                textAlign: TextAlign.center,
                activeColor: Color(0xFF1CBFA8),
                inactiveColor:Color(0xFF1CBFA8)

            ),
            BottomNavyBarItem(
                title: Text('Profile', style: TextStyle(color: Color(0xFF1CBFA8)),),
                icon: Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("images/userProfile.png")),
                textAlign: TextAlign.center,
                activeColor: Color(0xFF1CBFA8),
                inactiveColor:Color(0xFF1CBFA8)

            ),
          ],
        )
    );
  }

  buildpages() {
    switch(cindex) {
      case 0:
        return HomePage();
      case 1:
        return DoctorsNavbar();
      case 2:
        return AppointmentList();
      case 3:
        return HealthHistory();
      case 4:
        return ProfilePage();

    }
  }

  // bottomNavigationBar() {
  //
  //   final inactiveColor = Colors.red;
  //   return
  // }
}
