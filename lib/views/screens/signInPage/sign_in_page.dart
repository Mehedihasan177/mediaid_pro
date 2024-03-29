import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/signin_controller.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/signIn_model/signIn_model.dart';
import 'package:care_plus/responses/firebase_model.dart';
import 'package:care_plus/responses/signIn_response.dart';
import 'package:care_plus/responses_from_test_file/responses/user/signIn_response.dart';
import 'package:care_plus/services/call_check_service.dart';
import 'package:care_plus/services/firebase_services.dart';
import 'package:care_plus/views/screens/change_password/change_password.dart';
import 'package:care_plus/views/screens/forget_password/forget_password.dart';
import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/lib/pages/call_page.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/setUp_Profile/setUp_Profile.dart';
import 'package:care_plus/views/screens/sing_up_page/sign_up_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';



import '../calling_screen.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  // TextEditingController _textMobile = TextEditingController(text: "");
  // TextEditingController _textPassword = TextEditingController(text: "");

  TextEditingController _textMobile = TextEditingController();
  TextEditingController _textPassword = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.reference();
  //final Future<FirebaseApp> _future = Firebase.initializeApp();
  late DatabaseReference databaseReference;
  bool _passwordVisible = false;
  String countryCode = '+880';
  late String finalMobile = '';
  late String finalCountry = '+880';

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    String? obtainedMobile = sharedPreferences.getString("mobile");
    String? obtainedCountry = sharedPreferences.getString("country");

    setState(() {
      finalMobile = obtainedMobile!;
      _textMobile = TextEditingController(text: finalMobile);
      finalCountry = obtainedCountry!;
      countryCode = finalCountry;

    });
    print(finalMobile);
    print(finalCountry);
  }

  @override

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValidationData();

    databaseReference = databaseRef;
    // goForCallorNot(9);


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

        // scrollDirection: Axis.vertical,
        // shrinkWrap: true,
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
                  initialSelection: finalCountry,
                  favorite: ['+880', 'BD'],
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: TextField(
                    controller: _textMobile,
                    keyboardType: TextInputType.text,
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
                  obscureText: !_passwordVisible,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  //scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.all(20),
                    hintText: "Enter your password",
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



          ///firebase realtime data is showing in this section

          // Container(
          //   // height: 200,
          //   child: FirebaseAnimatedList(
          //       shrinkWrap: true,
          //       query: databaseReference.child('callModule').child('Patient').child('9'),
          //       itemBuilder: (BuildContext context, DataSnapshot snapshot,
          //           Animation animation, int index) {
          //         // print(snapshot.value);
          //
          //         // fetchHistoricalStockData(databaseReference.child('callModule').child('Patient').child('9'));
          //
          //
          //         return Text("${snapshot.value}\n");
          //       })
          // ),
          Center(
            child: Container(
              child: ElevatedButton(
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
                  SigninModel myInfo = new SigninModel(
                      mobile: countryCode +_textMobile.text, password: _textPassword.text);
                  USERNAME = countryCode + _textMobile.text;
                  USERPASS = _textPassword.text;
                 if(_textMobile == null){
                    SnackbarDialogueHelper().showSnackbarDialog(context, "Please enter phone number", Colors.red);
                  }else if(_textPassword.text.length < 8){
                    SnackbarDialogueHelper().showSnackbarDialog(context, "password is less than 6 digit or enter password", Colors.red);
                  }
                  else{
                   PHONEONLY = _textMobile.text;
                   COUNTRYCODE = countryCode;
                   await SigninController.requestThenResponsePrint(myInfo)
                       .then((value) async {
                     print(value.statusCode);
                     print(value.body);

                     final Map<String,dynamic> parsed = json.decode(value.body);

                     print("this is the token" + USERTOKEN);
                     //EasyLoading.dismiss();
                     if (value.statusCode == 200) {
                       sharedPreferences.setString("mobile", _textMobile.text);
                       sharedPreferences.setString("password", _textPassword.text);
                       SnackbarDialogueHelper().showSnackbarDialog(context, 'Sign in successfully', Colors.green);
                       return  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()),);
                     } else {
                       // return LoginController.requestThenResponsePrint(jsonData);
                       SnackbarDialogueHelper().showSnackbarDialog(context, value.body, Colors.red);
                     }

                   });
                 }
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ForgetPassword()));
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
                    Navigator.push(
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
