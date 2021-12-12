import 'package:care_plus/views/screens/hospital_list/hospital_list.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:flutter/material.dart';

class HospitalDetailsPage extends StatefulWidget {
  final String name;
  final String hospital;
  final String phone_number;
  final String address;
  final String website;
  final String image;
  final String about;
  final double latitude;
  final double longitude;

  const HospitalDetailsPage({Key? key,
    required this.name,
    required this.hospital,
    required this.phone_number,
    required this.address,
    required this.website,
    required this.latitude,
    required this.longitude,
    required this.about,
    required this.image,
  }) : super(key: key);

  @override
  _HospitalDetailsPageState createState() => _HospitalDetailsPageState();
}

class _HospitalDetailsPageState extends State<HospitalDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HospitalList()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HospitalList()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Ambulance Details",
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
            Image.asset(widget.image),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.hospital,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.name
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Address",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.address)),
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Phone Number",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.phone_number)),
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Website",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.website)),
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Details",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(widget.about)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Image.asset("images/map.png",),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                child: ElevatedButton(
                  child: Text(
                    "Call Now",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () async {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 59),
                    maximumSize: const Size(350, 59),
                    primary: Color(0xFF1CBFA8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                decoration: BoxDecoration(
                  //color: Color(0xF60D72),
                    borderRadius: BorderRadius.circular(18)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
