import 'package:care_plus/views/screens/health_history_ui/health_histoy_ui.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/uploaded_successfully/uploaded_successfully.dart';
import 'package:flutter/material.dart';

class UploadDocument extends StatefulWidget {
  const UploadDocument({Key? key}) : super(key: key);

  @override
  _UploadDocumentState createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  TextEditingController _textEmail = TextEditingController();
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => BottomNevigation())); //HealthHistory()
        return true;
      },
      child: Scaffold(
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Text(
              "Upload Documents",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20),
            child: Text(
              "Upload your Prescriptions, Lab reports or other informations",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    //flex: 1,
                    fit: FlexFit.loose,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 130,
                        width: 120,
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.07),
                        ), //BoxDecoration
                      ),
                    ), //Container
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 115),
                  child: Image.asset(
                    "images/camera.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 17,
                      width: 17,
                      child: Image(
                        image: AssetImage("images/prescription.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Prescription type",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Checkbox(
                          value: checkbox,
                          shape: CircleBorder(),
                          onChanged: (bool? value) {
                            setState(() {
                              checkbox = value!;
                            });
                          },
                        ),
                        // SizedBox(width: 20,),
                        Text(
                          "Prescription",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Checkbox(
                          value: !checkbox,
                          shape: CircleBorder(),
                          onChanged: (bool? value) {
                            setState(() {
                              checkbox = value!;
                            });
                          },
                        ),
                        // SizedBox(width: 10,),
                        Text(
                          "Lab Reports",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("images/calendar.png"),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Visiting Date",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Selection of Date")),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              children: [
                Row(children: [
                  Image.asset("images/man.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Doctor Name",
                    style: TextStyle(fontSize: 17),
                  ),
                ]),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 35),
                    width: 200,
                    child: TextField(
                      controller: _textEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(20),
                          hintText: "Enter doctor name",
                          hintStyle: TextStyle(fontSize: 13)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              children: [
                Row(children: [
                  Image.asset("images/title.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 17),
                  ),
                ]),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 35),
                    width: 200,
                    child: TextField(
                      controller: _textEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(20),
                          hintText: "Enter doctor name",
                          hintStyle: TextStyle(fontSize: 13)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 150,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text("Description", style: TextStyle(fontSize: 15),),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              child: ElevatedButton(
                child: Text(
                  "Upload",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => UploadedSuccessfully()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 61),
                  maximumSize: const Size(350, 61),
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
            height: 30,
          ),
        ]),
      ),
    );
  }
}
