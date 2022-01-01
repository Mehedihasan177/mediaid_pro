import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/controllers/user/signin_controller.dart';
import 'package:care_plus/controllers/user/user_update_controller.dart';
import 'package:care_plus/helper/alertDialogue.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/signIn_model/signIn_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/signIn_response.dart';
import 'package:care_plus/responses_from_test_file/responses/user/user_profile_update_response.dart'
    as update;
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/profile/profile.dart';
import 'package:care_plus/views/screens/setUp_Profile/image_upload_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class UpdateProfile extends StatefulWidget {
  // final int page;
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController _textName =
      TextEditingController(text: SIGNINGRESPONSE.name);
  TextEditingController _textAddress =
      TextEditingController(text: SIGNINGRESPONSE.address);
  TextEditingController _textPhone =
      TextEditingController(text: SIGNINGRESPONSE.mobile);
  TextEditingController _textEmail =
      TextEditingController(text: SIGNINGRESPONSE.email);
  TextEditingController _textWeight =
      TextEditingController(text: SIGNINGRESPONSE.weight.replaceAll("null", "0"));
  TextEditingController _textHeight =
      TextEditingController(text: SIGNINGRESPONSE.height.replaceAll("null", "0"));

  bool checkbox = true;
  String gender = 'Male';

  String dateTime = '';
  late DateTime _selectedDate;

  //Method for showing the date picker

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Update profile", null),
        body: ListView(children: [

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
                                  NewImageUploadPage(page: 1)),
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
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 36, right: 20),
            child: Column(
              children: [
                ///Name
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
                  controller: _textName,
                  keyboardType: TextInputType.text,
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
                      child: Image(
                        image: AssetImage("images/gender.png"),
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
                              print('value');
                              print(value);
                              if (checkbox == false) checkbox = !checkbox;
                            });
                          },
                        ),
// SizedBox(width: 20,),
                        Text(
                          "Male",
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
                              print('value');
                              print(value);
                              if (checkbox == true) checkbox = !checkbox;
                            });
                          },
                        ),
// SizedBox(width: 10,),
                        Text(
                          "Female",
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

          ///Calender
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 20,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "Date of Birth       ",
                          style: TextStyle(fontSize: 17),
                        ),
                        Text("${SIGNINGRESPONSE.dob}".replaceAll("null", " "))
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () {
                        Picker(
                          backgroundColor: Colors.blue,
                            hideHeader: true,
                            adapter: DateTimePickerAdapter(),
                            title: Text("Select Data"),
                            selectedTextStyle: TextStyle(color: Colors.blue),
                            onConfirm: (Picker picker, List value) {
                              print((picker.adapter as DateTimePickerAdapter)
                                  .value);
                              dateTime =
                                  (picker.adapter as DateTimePickerAdapter)
                                      .value
                                      .toString();
                              dateTime = DateFormat('yyyy-MM-dd')
                                  .format(DateTime.parse(dateTime.toString()));
                              print("dateTime");
                              print(dateTime);
                              setState(() {
                                dateTime = dateTime;
                              });
                            }).showDialog(context);
                      },
                      child: Text("Select date of birth: " + "${dateTime}")),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),

          ///Address
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              children: [
                Row(children: [
                  Icon(Icons.location_on,
                      size: 30, color: Colors.black.withOpacity(0.5)),
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

          ///Phone Number
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              children: [
                Row(children: [
                  Icon(
                    Icons.call,
                    size: 22,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 17),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 43.0, right: 10),
                  child: TextField(
                    enableInteractiveSelection: false, // will disable paste operation
                    readOnly: true,
                    controller: _textPhone,
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

          ///Email
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              children: [
                Row(children: [
                  Icon(
                    Icons.email_outlined,
                    size: 22,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 17),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 43.0, right: 10),
                  child: TextField(
                    enableInteractiveSelection: false, // will disable paste operation
                    readOnly: true,
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
          SizedBox(
            height: 30,
          ),

          ///Weight
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          width: 90,
                          child: TextField(
                            controller: _textWeight,
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
                    ],
                  ),
                ),

                ///Height
                Expanded(
                  flex: 2,
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
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Container(
                          width: 90,
                          child: TextField(
                            controller: _textHeight,
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
                  // EasyLoading.show(status: 'loading...');

                  print(checkbox);
                  if (checkbox == true) {
                    gender = 'Male';
                  } else {
                    gender = 'Female';
                  }
                  print(gender);
                  Map data1 = {
                    'name': "${_textName.text}",
                    'gender': "${gender}",
                    'dob': "${dateTime}",
                    'address': "${_textAddress.text}",
                    'mobile': "${_textPhone.text}",
                    'email': "${_textEmail.text}",
                    'weight': "${_textWeight.text}",
                    'height': "${_textHeight.text}",
                  };
                  //EasyLoading.show(status: 'loading...');
                  await UserUpdateController.requestThenResponsePrint(
                          USERTOKEN, data1)
                      .then((value) async {
                    print(value.statusCode);
                    print(value.body);
                    final Map parsed = json.decode(value.body);

                    final doctorProfile = update.Data.fromJson(parsed);

                    print(value.statusCode);
                    print(value.body);
                    //EasyLoading.dismiss();
                    if (value.statusCode == 200) {
                      USERNAME = _textPhone.text;
                      signInAgain(context);
                      SnackbarDialogueHelper().showSnackbarDialog(
                          context, 'successfully Added', Colors.green);
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNevigation()),
                      );
                    } else {
                      SnackbarDialogueHelper().showSnackbarDialog(
                          context,
                          value.body
                              .replaceAll('"', ' ')
                              .replaceAll('{', ' ')
                              .replaceAll('}', ' ')
                              .replaceAll('[', ' ')
                              .replaceAll(']', ' '),
                          Colors.red);
                    }
                  });
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

  Future<void> signInAgain(BuildContext context) async {
    //EasyLoading.show(status: 'loading...');

    SigninModel myInfo = new SigninModel(
      mobile: USERNAME,
      password: USERPASS,
    );
    await SigninController.requestThenResponsePrint(myInfo).then((value) async {
      print(value.statusCode);
      print(value.body);
      final Map parsed = json.decode(value.body);

      final loginobject = Data.fromJson(parsed);
      print(loginobject.token);
      print(loginobject.token);

      USERTOKEN = loginobject.token;
      // sharedPreferences.setString("token", loginobject.accessToken);
      //EasyLoading.dismiss();
      if (value.statusCode == 200) {
        USERPASS = USERPASS;
        USERNAME = USERNAME;
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNevigation()),
        );
      } else {
        // return LoginController.requestThenResponsePrint(jsonData);
        SnackbarDialogueHelper().showSnackbarDialog(context, 'Please recheck email and password', Colors.red);

      }
    });
  }

  showPickerDate(BuildContext context) {
    Picker(
        hideHeader: true,
        adapter: DateTimePickerAdapter(),
        title: Text("Select Data"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
        }).showDialog(context);
  }
}
