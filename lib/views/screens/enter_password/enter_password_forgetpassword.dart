import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/otp/otp.dart';
import 'package:flutter/material.dart';

class EnterPasswordForgetPassword extends StatefulWidget {
  const EnterPasswordForgetPassword({Key? key}) : super(key: key);

  @override
  _EnterPasswordForgetPasswordState createState() => _EnterPasswordForgetPasswordState();
}

class _EnterPasswordForgetPasswordState extends State<EnterPasswordForgetPassword> {
  TextEditingController _textEmail = TextEditingController();
  TextEditingController _textPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OTPpage()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text("Forget Password", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5)
                ),
                ),
              ),
            ),

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
                    controller: _textEmail,
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
                    "Next",
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
            // SizedBox(
            //   height: 20,
            // ),

          ],
        ),
      ),
    );
  }
}
