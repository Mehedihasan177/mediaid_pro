import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/controllers/user/change_password_controller.dart';
import 'package:care_plus/controllers/user/signin_controller.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/change_password_model.dart';
import 'package:care_plus/models/signIn_model/signIn_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/signIn_response.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/otp/otp_three.dart';
import 'package:care_plus/views/screens/profile/profile.dart';
import 'package:care_plus/views/screens/reset_Password/reset_Password.dart';
import 'package:care_plus/views/screens/signInPage/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _oldPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Change Password", null),
        body: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

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


            ///old Password

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
                        "Old Password",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextField(
                    controller: _oldPassword,
                    obscureText: !_passwordVisible,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    //scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.all(20),
                      hintText: "Enter your old password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xFF1CBFA8),
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),

            ///new password

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.lock_open,
                        size: 18,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "New Password",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextField(
                    controller: _newPassword,
                    obscureText: !_passwordVisible1,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    //scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.all(20),
                      hintText: "Enter new password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xFF1CBFA8),
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible1 = !_passwordVisible1;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),


            ///confirm password


            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.lock_open,
                        size: 18,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Confirm Password",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextField(
                    controller: _confirmPassword,
                    obscureText: !_passwordVisible2,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    //scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.all(20),
                      hintText: "Confirm new password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible2
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xFF1CBFA8),
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible2 = !_passwordVisible2;
                          });
                        },
                      ),
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


                    if(_oldPassword.text!=USERPASS){
                      SnackbarDialogueHelper().showSnackbarDialog(context, 'Old Password not matched',Colors.red);
                    }else if(_newPassword.text.length<6){
                      SnackbarDialogueHelper().showSnackbarDialog(context, 'Password Should be 6 digit',Colors.red);
                    }else if(_newPassword.text != _confirmPassword.text){
                      SnackbarDialogueHelper().showSnackbarDialog(context, 'Please Confirm new Password',Colors.red);
                    }else{
                      print("token of user\n");
                      print("token at call mehedi hasan who are you: " + USERTOKEN);
                      PasswordChange passChange = new PasswordChange(_oldPassword.text, _newPassword.text, _confirmPassword.text);
                      UserChangePass.requestThenResponsePrint(context, USERTOKEN, passChange).then((value) async {
                        print('dddddddd');
                        print(value.statusCode);
                        if (value.statusCode == 200) {

                          print("successfully done");
                          print(value.body);
                          SigninModel myInfo = new SigninModel(
                              mobile: USERNAME, password: USERPASS);
                          await SigninController.requestThenResponsePrint(myInfo)
                              .then((value) async {
                            print(value.statusCode);
                            print(value.body);

                            if (value.statusCode == 200) {
                              SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                              setState(() {
                                var reobj = SignInResponse.fromJson(json.decode(value.body));
                                var loginobject = reobj.data.user;
                                var loginobject1 = reobj.data;


                                print('loginobject.image');
                                print(loginobject.image);
                                SIGNINGRESPONSE = loginobject;
                                print(loginobject1.token);
                                sharedPreferences.setString("token", loginobject1.token);

                                USERPASS = _confirmPassword.text;

                                sharedPreferences.setString("mobile", USERNAME);
                                sharedPreferences.setString("password", USERPASS);
                              });
                            }
                          });
                          SnackbarDialogueHelper().showSnackbarDialog(context, 'Password changed successfully', Colors.green);
                          //SnackbarDialogueHelper().showSnackbarDialog(context, "New Passowrd",value.body);
                          return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              BottomNevigation()), (Route<dynamic> route) => false);
                        }
                        else{
                          // SnackbarDialogueHelper().showSnackbarDialog(context, 'Password not matched $passChange', Colors.red);
                          SnackbarDialogueHelper().showSnackbarDialog(context, value.body,Colors.red);
                        }
                      });
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
            // SizedBox(
            //   height: 20,
            // ),

          ],
        ),
      ),
    );
  }
}
