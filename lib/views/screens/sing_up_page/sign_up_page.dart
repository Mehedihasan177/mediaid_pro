import 'dart:convert';
import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/registration_controller.dart';
import 'package:care_plus/controllers/user/signin_controller.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/reg_requst_model.dart';
import 'package:care_plus/models/signIn_model/signIn_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/signIn_response.dart';
import 'package:care_plus/views/screens/setUp_Profile/setUp_Profile.dart';
import 'package:care_plus/views/screens/signInPage/sign_in_page.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  TextEditingController _textEmail = TextEditingController();
  TextEditingController _textName = TextEditingController();
  TextEditingController _textMobile = TextEditingController();
  TextEditingController _textPassword = TextEditingController();
  TextEditingController _textConfirmPassword = TextEditingController();
  TextEditingController _textaddress = TextEditingController(text: "");
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;

  String countryCode = '+61';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SingInPage()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    image: AssetImage("images/care+_Logo.png"),
                    fit: BoxFit.fill,
                    height: 250,
                    width: 250,
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
                            Icons.email,
                            size: 18,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Email",
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
                          hintText: "Enter your email address",
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
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
                            Icons.people_outline,
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
                        decoration: InputDecoration(
                          hintText: "Enter your name",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 20),
                  child: Column(
                    children: [

                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 18,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Phone Number",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:1,
                            child: CountryCodePicker(
                              onChanged: (code){
                                setState(() {
                                  countryCode = code.dialCode!;
                                });
                              },
                              showFlag: true,
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: countryCode,
                              favorite: ['+880', 'BD'],
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: TextField(
                                controller: _textMobile,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.black),
                                //scrollPadding: EdgeInsets.all(10),
                                decoration: InputDecoration(
                                  //contentPadding: EdgeInsets.all(20),
                                  hintText: "Enter your phone number",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
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
                            Icons.account_balance,
                            size: 18,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Address",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextField(
                        controller: _textaddress,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
                        //scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(20),
                          hintText: "Enter your address",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
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
                        obscureText: !_passwordVisible1,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
                        //scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(20),
                          hintText: "Enter your password",
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
                  height: 20,
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
                            "Confirm Password",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextField(
                        controller: _textConfirmPassword,
                        keyboardType: TextInputType.text,
                        obscureText: !_passwordVisible,
                        style: TextStyle(color: Colors.black),
                        //scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(20),
                          hintText: "Confirm your password",
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
                Center(
                  child: Container(
                    child: ElevatedButton(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      // onPressed: () async {
                      //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OTPpage()));
                      // },
                      onPressed: () async{

                        //EasyLoading.show(status: 'loading...');
                        RegReqModel myInfo = new RegReqModel(
                          name: _textName.text,
                          email: _textEmail.text,
                          password: _textPassword.text,
                          mobile: countryCode+_textMobile.text,
                          address: _textaddress.text,
                          password_confirmation: _textConfirmPassword.text,
                          image: '',
                        );
                        if(_textEmail.text.length == 0){
                          SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter email id", Colors.red);
                        }else if(!(RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(_textEmail.text))){
                          SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter a valid email", Colors.red);
                        }else if(_textPassword.text.length == 0){
                          SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter name", Colors.red);
                        }else if(_textName.text.length == 0){
                          SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter AHPRA No.", Colors.red);
                        }else if(_textMobile.text.length == 0){
                          SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter phone number", Colors.red);
                        }else if(_textPassword.text.length < 8){
                          SnackbarDialogueHelper().showSnackbarDialog(context, "password is less than 6 digit or enter password", Colors.red);
                        }else if(_textConfirmPassword.text.length != _textPassword.text.length){
                          SnackbarDialogueHelper().showSnackbarDialog(context, "Given password is not matched", Colors.red);
                        }
                        else{
                          await RegistrationController.requestThenResponsePrint(myInfo).then((value2) async {
                            print(value2.statusCode);
                            print(value2.body);
                            //EasyLoading.dismiss();
                            if(value2.statusCode==200){
                              PHONEONLY = _textMobile.text;
                              COUNTRYCODE = countryCode;
                              print("successfull");
                              //EasyLoading.showSuccess('logging in...');
                              SigninModel myInfo = new SigninModel(
                                  mobile: countryCode+_textMobile.text, password: _textPassword.text);
                              await SigninController.requestThenResponsePrint(myInfo)
                                  .then((value) async {
                                print(value.statusCode);
                                print(value.body);
                                final Map parsed = json.decode(value.body);
                                USERNAME = countryCode + _textMobile.text;
                                USERPASS = _textPassword.text;
                                var jsonData = null;
                                SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                                final loginobject = SignInResponse.fromJson(parsed);
                                print(loginobject.data.token);
                                sharedPreferences.setString("token", loginobject.data.token);
                                //EasyLoading.dismiss();
                                if (value.statusCode == 200) {
                                  COUNTRYCODE = countryCode;
                                  sharedPreferences.setString("mobile", countryCode+_textMobile.text);
                                  sharedPreferences.setString("password", _textPassword.text);
                                  SnackbarDialogueHelper().showSnackbarDialog(context, 'Sign up successfully', Colors.green);
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                      SetupProfile()), (Route<dynamic> route) => false);
                                } else {
                                  // return LoginController.requestThenResponsePrint(jsonData);
                                  SnackbarDialogueHelper().showSnackbarDialog(context, 'Please check email and password', Colors.red);
                                }
                              });

                            }else{
                              SnackbarDialogueHelper().showSnackbarDialog(context, value2.body.replaceAll("{", "").replaceAll("}", "")
                                  .replaceAll("[", "").replaceAll("]", ""), Colors.red

                              );
                              print(value2.body);
                            }
                          });
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 59),
                        maximumSize: const Size(300, 59),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 16, color: Colors.black.withOpacity(0.5)),
                      ),
                      FlatButton(
                        minWidth: 10,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => SingInPage()));
                        },
                        child: Text(
                          "Sign in",
                          style:
                          TextStyle(fontSize: 16, color: Color(0xFF1CBFA8)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Text("Or Sign in with"),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                        ),
                      )
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
