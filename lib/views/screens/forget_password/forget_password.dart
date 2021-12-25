import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/reset_password_controller.dart';
import 'package:care_plus/controllers/user/signin_controller.dart';
import 'package:care_plus/helper/alertDialogue.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/reset_password_model.dart';
import 'package:care_plus/models/signIn_model/signIn_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/signIn_response.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/otp/otp.dart';
import 'package:care_plus/views/screens/otp/otp_two.dart';
import 'package:care_plus/views/screens/reset_Password/reset_Password.dart';
import 'package:care_plus/views/screens/signInPage/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _textEmail = TextEditingController();
  TextEditingController _textPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.push(context,MaterialPageRoute(builder: (context) => SingInPage()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Forget Password', style: TextStyle(
            color: Colors.black
        ),

        ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [



            Center(
              child: Image(
                height: 250,
                width: 250,
                image: AssetImage("images/care+_Logo.png",),
                fit: BoxFit.fill,
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
                        Icons.email_outlined,
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
                    controller: _textEmail,
                    keyboardType: TextInputType.emailAddress,
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
            Center(
              child: Container(
                child: ElevatedButton(
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
    onPressed: () {
            print("token of user\n");
            print("token at call mehedi hasan who are you: " + USERTOKEN);
            ResetPasswordModel passChange = new ResetPasswordModel(mobile: _textEmail.text);

            ResetPasswordController.requestThenResponsePrint(passChange).then((value) async {
              print('dddddddd');
              print(value.statusCode);
              if (value.statusCode == 200) {
                //USERNAME = _textEmail.text;
                print("successfully done");
                print(value.body);
                SnackbarDialogueHelper().showSnackbarDialog(context, 'Password reset successfully ${value.body}', Colors.green);
                // SnackbarDialogueHelper().showSnackbarDialog(context, "New Passowrd",value.body);
                return Navigator.push(context,MaterialPageRoute(builder: (context) => SingInPage()),);

              }else{
                SnackbarDialogueHelper().showSnackbarDialog(context, 'Password not reset', Colors.green);
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
            // SizedBox(
            //   height: 20,
            // ),

          ],
        ),
      ),
    );
  }
}
