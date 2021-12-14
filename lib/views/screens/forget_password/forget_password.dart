import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/reset_password_controller.dart';
import 'package:care_plus/helper/alertDialogue.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/reset_password_model.dart';
import 'package:care_plus/views/screens/otp/otp.dart';
import 'package:care_plus/views/screens/otp/otp_two.dart';
import 'package:care_plus/views/screens/reset_Password/reset_Password.dart';
import 'package:care_plus/views/screens/signInPage/sign_in_page.dart';
import 'package:flutter/material.dart';

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
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SingInPage()));
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
                        Icons.email_outlined,
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
                      hintText: "Enter your email",
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

            ResetPasswordController.requestThenResponsePrint(passChange, USERTOKEN, ).then((value) {
              print('dddddddd');
              print(value.statusCode);
              if (value.statusCode == 200) {
                print("successfully done");
                print(value.body);
                SnackbarDialogueHelper().showSnackbarDialog(context, 'Password reset successfully $passChange', Colors.green);
                AlertDialogueHelper().showAlertDialog(context, "New Passowrd",value.body);
                // if (yOn == 0) {
                //   navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => ChangePasswordSuccessPage()));
                // } else {
                //   SigninController.requestThenResponsePrint(context, widget.userType, widget.userPhone, newPassC.text);
                // }
              }else{
                SnackbarDialogueHelper().showSnackbarDialog(context, 'Password not reset', Colors.green);
                // BasicFunctions.showAlertDialogTOView(context,
                //     AppLocalizations.of(context).translate("passwordRecheckTitle"),
                //     AppLocalizations.of(context).translate("passwordRecheckMessage"));
                // BasicFunctions.showAlertDialogTOView(context, "Warning", "Please recheck your passwords to change");
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
