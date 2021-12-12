import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController _textEmail = TextEditingController();
  bool checkbox = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: ListView(
            children:[
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Text("Update your profile",
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
              Padding(
                padding: const EdgeInsets.only(left: 36, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.people,
                          size: 18,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextField(
                      controller: _textEmail,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      //scrollPadding: EdgeInsets.all(10),
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.all(20),
                        hintText: "Enter your name",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                          Icon(Icons.location_on, size: 30, color: Colors.black.withOpacity(0.5)),
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
                          Icon(Icons.call, size: 22,color: Colors.black.withOpacity(0.5),),
                          SizedBox(width: 10,),
                          Text("Phone Number",
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
                          hintText: "Enter your phone number",
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
                          Icon(Icons.email_outlined, size: 22,color: Colors.black.withOpacity(0.5),),
                          SizedBox(width: 10,),
                          Text("Email",
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
                          hintText: "Enter your email address",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30,),

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
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
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
