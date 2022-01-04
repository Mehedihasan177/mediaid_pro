import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/controllers/user/signin_controller.dart';
import 'package:care_plus/controllers/user/user_update_controller.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/signIn_model/signIn_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/user_profile_update_response.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/responses_from_test_file/responses/user/signIn_response.dart' as login;

import 'package:care_plus/views/screens/sing_up_page/sign_up_page.dart';

import 'package:flutter/material.dart';

import 'image_upload_page.dart';


class SetupProfile extends StatefulWidget {
  const SetupProfile({Key? key}) : super(key: key);

  @override
  _SetupProfileState createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  TextEditingController _textAddress = TextEditingController();
  TextEditingController _textMedicareID = TextEditingController();
  TextEditingController _textWeight = TextEditingController();
  TextEditingController _textHeight = TextEditingController();
  bool checkbox = true;
  String gender = 'Male';




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => SingUpPage()));
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Set up profile", null),
        body: ListView(children: [



          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Stack(children: [
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewImageUploadPage(page: 2)),
                            );
                          },
                          child: CircleAvatar(
                            radius: 78,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                                child: Image.network(
                                  '$apiDomainRoot/images/${SIGNINGRESPONSE.image}',
                                  fit: BoxFit.fill,
                                  width: 170,
                                  height: 190,
                                )),
                          ),
                        ), //Container
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NewImageUploadPage(page: 1)),
                      );
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 138),
                        child: Image.asset(
                          "images/camera.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                ]),
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
                              print('value');
                              print(value);
                              if(checkbox==false)checkbox = !checkbox;
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
                              print('value');
                              print(value);
                              if(checkbox==true)checkbox = !checkbox;
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
            padding: EdgeInsets.only(left: 25),
            child: Column(
              children: [
                Row(children: [
                  Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Address",
                    style: TextStyle(fontSize: 17),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 43.0, right: 10),
                  child: TextField(
                    controller: _textAddress,
                    keyboardType: TextInputType.text,
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
                Row(children: [
                  Image.asset(
                    "images/medicare_id.png",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Medicare ID",
                    style: TextStyle(fontSize: 17),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 43.0, right: 10),
                  child: TextField(
                    controller: _textMedicareID,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    //scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.all(20),
                      hintText: "Enter your medicare id",
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
                      Row(children: [
                        Image.asset(
                          "images/weight.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Weight",
                          style: TextStyle(fontSize: 17),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 10),
                        child: Container(
                          width: 90,
                          child: TextField(
                            controller: _textWeight,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black),
                            //scrollPadding: EdgeInsets.all(10),
                            decoration: InputDecoration(
                              //contentPadding: EdgeInsets.all(20),
                              hintText: "Weight",
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
                      Row(children: [
                        Image.asset(
                          "images/height.png",
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Height",
                          style: TextStyle(fontSize: 17),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 10),
                        child: Container(
                          width: 90,
                          child: TextField(
                            controller: _textHeight,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.black),
                            //scrollPadding: EdgeInsets.all(10),
                            decoration: InputDecoration(
                              //contentPadding: EdgeInsets.all(20),
                              hintText: "Height",
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
                onPressed: () async{

                  // EasyLoading.show(status: 'loading...');
                  print(checkbox);
                  if(checkbox==true){
                    gender='Male';
                  }else{
                    gender='Female';
                  }
                  print(gender);

                  Map data1 = {
                    'gender': "${gender}",
                    'address': "${_textAddress.text}",
                    'medicare_no': "${_textMedicareID.text}",
                    'weight': "${_textWeight.text}",
                    'height': "${_textHeight.text}",



                  };
                  print(USERTOKEN);

              if(_textMedicareID.text.isEmpty){
                SnackbarDialogueHelper().showSnackbarDialog(context, 'Please enter Medicare ID', Colors.red);
              }else{
                await UserUpdateController.requestThenResponsePrint( USERTOKEN, data1).then((value) async {
                  print(value.statusCode);
                  print("mmmmmm :   ");
                  print(value.body);
                  final Map parsed = json.decode(value.body);

                  if(value.statusCode==200){

                    SnackbarDialogueHelper().showSnackbarDialog(context, 'successfully set up your profile', Colors.green);
                    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        BottomNevigation()), (Route<dynamic> route) => false);

                  }else{
                    SnackbarDialogueHelper().showSnackbarDialog(context, value.body.replaceAll('"', ' ')
                        .replaceAll('{', ' ')
                        .replaceAll('}', ' ')
                        .replaceAll('[', ' ')
                        .replaceAll(']', ' '), Colors.red);
                  }
                }
                );
              }


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
        ]),
      ),
    );
  }

}
