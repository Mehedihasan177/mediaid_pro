import 'dart:convert';
import 'package:care_plus/controllers/user/registration_controller.dart';
import 'package:care_plus/models/reg_requst_model.dart';
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
  TextEditingController _textaddress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SingInPage()));
        return true;
      },
      child: Scaffold(
        body: ListView(
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
                        keyboardType: TextInputType.text,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CountryCodePicker(
                            onChanged: print,
                            showFlag: false,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'BD',
                            favorite: ['+39', 'FR'],
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              "Phone Number",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                            "address",
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
                        keyboardType: TextInputType.text,
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
                        style: TextStyle(color: Colors.black),
                        //scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(20),
                          hintText: "Confirm your password",
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
                          mobile: _textMobile.text,
                          address: _textaddress.text,
                          password_confirmation: _textConfirmPassword.text,
                          image: '',
                        );
                        await RegistrationController.requestThenResponsePrint(myInfo).then((value) async {
                          print(value.statusCode);
                          print(value.body);
                          //EasyLoading.dismiss();
                          if(value.statusCode==200){
                            print("successfull");
                            // //EasyLoading.showSuccess('logging in...');
                            // SigninModel myInfo = new SigninModel(
                            //     mobile: "111222", password: "12349876");
                            // await SigninController.requestThenResponsePrint(myInfo)
                            //     .then((value) async {
                            //   print(value.statusCode);
                            //   print(value.body);
                            //   final Map parsed = json.decode(value.body);
                            //
                            //   var jsonData = null;
                            //   SharedPreferences sharedPreferences =
                            //   await SharedPreferences.getInstance();
                            //   final loginobject = SignInResponse.fromJson(parsed);
                            //   print(loginobject.data.token);
                            //   sharedPreferences.setString("token", loginobject.data.token);
                            //   //EasyLoading.dismiss();
                            //   if (value.statusCode == 200) {
                            //     sharedPreferences.setString("mobile", "111222");
                            //     sharedPreferences.setString("password", "12349876");
                            //     //return Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ChangePassword(Usertoken: loginobject.data.token)),);
                            //   } else {
                            //     // return LoginController.requestThenResponsePrint(jsonData);
                            //     AlertDialogueHelper().showAlertDialog(context, 'Warning', 'Please recheck email and password');
                            //   }
                            //
                            // });

                          }else{
                            //AlertDialogueHelper().showAlertDialog(context, '', value.body);
                            print(value.body);
                          }
                        });

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
                          // Navigator.pushReplacement(
                          //     context, MaterialPageRoute(builder: (context) => SingInPage()));
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