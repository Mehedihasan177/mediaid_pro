import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/otp/otp.dart';
import 'package:care_plus/views/screens/sing_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({Key? key}) : super(key: key);

  @override
  _SetupProfileState createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  TextEditingController _textEmail = TextEditingController();
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OTPpage()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children:[
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text("Set up your profile",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black.withOpacity(0.5),
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Text("Update your profile picture or renew informaton",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                children:
                [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      //flex: 1,
                      fit: FlexFit.loose,
                      child: GestureDetector(
                        onTap: (){},
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
                      child: Image.asset("images/camera.png", height: 30,width: 30,),
                    ),
                  ),
              ]
              ),
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
                        child: Image(image: AssetImage("images/gender.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Gender",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
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
                          Text("Male", style: TextStyle(fontSize: 15),),
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
                          Text("Female", style: TextStyle(fontSize: 15),),
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
                      Icon(Icons.calendar_today, size: 20,),
                      SizedBox(width: 15,),
                      Text("Date of Birth",
                      style: TextStyle(
                        fontSize: 17
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Select date of birth")),
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
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 30,),
                      SizedBox(width: 10,),
                      Text("Address",
                      style: TextStyle(
                        fontSize: 17
                      ),
                      ),
                    ]
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 43.0, right: 10),
                    child: TextField(
                      controller: _textEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Enter your address",
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
                  Row(
                      children: [
                        Image.asset("images/medicare_id.png", height: 30,width: 30,),
                        SizedBox(width: 10,),
                        Text("Medicare Id",
                          style: TextStyle(
                              fontSize: 17
                          ),
                        ),
                      ]
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 43.0, right: 10),
                    child: TextField(
                      controller: _textEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Enter your medicare Id",
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
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            children: [
                              Image.asset("images/weight.png", height: 30,width: 30,),
                              SizedBox(width: 10,),
                              Text("Weight",
                                style: TextStyle(
                                    fontSize: 17
                                ),
                              ),
                            ]
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Flexible(
                            //flex: 1,
                            fit: FlexFit.loose,
                            child: Container(
                              width: 90,
                              child: TextField(
                                controller: _textEmail,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.black),
                                //scrollPadding: EdgeInsets.all(10),
                                decoration: InputDecoration(
                                  //contentPadding: EdgeInsets.all(20),
                                  hintText: "Weight",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            children: [
                              Image.asset("images/height.png", height: 30,width: 30,),
                              SizedBox(width: 10,),
                              Text("Height",
                                style: TextStyle(
                                    fontSize: 17
                                ),
                              ),
                            ]
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Flexible(
                            //flex: 1,
                            fit: FlexFit.loose,
                            child: Container(
                              width: 90,
                              child: TextField(
                                controller: _textEmail,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.black),
                                //scrollPadding: EdgeInsets.all(10),
                                decoration: InputDecoration(
                                  //contentPadding: EdgeInsets.all(20),
                                  hintText: "Height",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () async {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()));
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
              height: 30,
            ),
          ]
        ),
      ),
    );
  }
}
