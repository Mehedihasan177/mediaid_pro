import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/signin_controller.dart';
import 'package:care_plus/helper/alertDialogue.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/signIn_model/signIn_model.dart';
import 'package:care_plus/responses/signIn_response.dart';
import 'package:care_plus/responses_from_test_file/responses/user/signIn_response.dart';
import 'package:care_plus/views/screens/change_password/change_password.dart';
import 'package:care_plus/views/screens/forget_password/forget_password.dart';
import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/setUp_Profile/setUp_Profile.dart';
import 'package:care_plus/views/screens/sing_up_page/sign_up_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  TextEditingController _textMobile = TextEditingController(text: "01716");
  TextEditingController _textPassword = TextEditingController(text: "11223344");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              child: Image(
                image: AssetImage("images/care+_Logo.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.dock,
                      size: 18,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Mobile Number",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                TextField(
                  controller: _textMobile,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  //scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.all(20),
                    hintText: "Enter your mobile number",
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lock,
                      size: 18,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                TextField(
                  controller: _textPassword,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  //scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.all(20),
                    hintText: "Enter your password",
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
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  //EasyLoading.show(status: 'loading...');

                  // SharedPreferences sharedPreferences =
                  // await SharedPreferences.getInstance();
                  SigninModel myInfo = new SigninModel(
                      mobile: _textMobile.text, password: _textPassword.text);
                  USERNAME = _textMobile.text;
                  USERPASS = _textPassword.text;
                  await SigninController.requestThenResponsePrint(myInfo)
                      .then((value) async {
                    print(value.statusCode);
                    print(value.body);

                    final Map<String,dynamic> parsed = json.decode(value.body);

                    print("this is the token" + USERTOKEN);
                    //EasyLoading.dismiss();
                    if (value.statusCode == 200) {

                      SnackbarDialogueHelper().showSnackbarDialog(context, 'Sign in successfully', Colors.green);
                      return  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()),);
                    } else {
                      // return LoginController.requestThenResponsePrint(jsonData);
                      SnackbarDialogueHelper().showSnackbarDialog(context, value.body, Colors.red);
                    }

                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 59),
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
          // SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FlatButton(
              minWidth: 10,
              onPressed: () {
                // Navigator.pushReplacement(
                //     context, MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
              child: Text(
                "Forget Password?",
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Text("Or Sign in with"),
                Expanded(
                    child: Divider(
                      color: Colors.black,
                    ))
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  minWidth: 5,
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //     context, MaterialPageRoute(builder: (context) => DoctorCatagory()));
                  },
                  child: Image.asset(
                    "images/google.png",
                    height: 30,
                    width: 30,
                  ),
                ),


                FlatButton(
                  minWidth: 5,
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //     context, MaterialPageRoute(builder: (context) => DoctorCatagory()));
                  },
                  child: Image.asset(
                    "images/facebook.png",
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Haven't any?",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(0.5)),
                ),
                FlatButton(
                  minWidth: 10,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => SingUpPage()));
                  },
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                        fontSize: 16, color: Color(0xFF1CBFA8)),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
