import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/data/ambulance_list_data/ambulance_list_data.dart';
import 'package:care_plus/models/ui_model/ambulance_model/ambulance_model.dart';
import 'package:care_plus/views/screens/ambulance_list/ambulance_list.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/ambulance_hospital_details_widget/ambulance_hospital_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulanceDetailsPage extends StatefulWidget {
  final String name;
  final String hospital;
  final String details;
  final String phone_number;
  final String address;
  final String image;
  final String website;


  const AmbulanceDetailsPage({
    Key? key,
    required this.name,
    required this.hospital,
    required this.details,
    required this.phone_number,
    required this.address,
    required this.image,
    required this.website,

  }) : super(key: key);

  @override
  _AmbulanceDetailsPageState createState() => _AmbulanceDetailsPageState();
}

class _AmbulanceDetailsPageState extends State<AmbulanceDetailsPage> {


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => AmbulanceList()));
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Ambulance Details", null),
        body: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

          children: [

            Image.network(
                '$apiDomainRoot/images/${widget.image}'


            ),
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
                        child: Text("Phone",
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
                        child: Text(widget.details)),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 50),
            // Image.asset("images/map.png",),
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
                    _launchURL("tel://${widget.phone_number}");

                    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
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


  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
