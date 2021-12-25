import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/others/recharge_request.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:flutter/material.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({Key? key}) : super(key: key);

  @override
  _RechargeScreenState createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {

  TextEditingController _gatewayC = TextEditingController();
  TextEditingController _noteC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Recharge Wallet'),
        backgroundColor: Color(0xff1CBFA8),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

            children: [
              Text('Please Enter Transaction Gateway',style: TextStyle(fontSize: 16),),
              SizedBox(height: 5,),
              TextField(
                controller: _gatewayC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: 'Please Enter Transaction Gateway',
                    // helperText: '',
                    labelText: 'Payment Gateway',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    prefixText: ' ',
                    suffixStyle: const TextStyle(color: Colors.green)),
              ),

              SizedBox(height: 7,),
              Text('Please Enter Transaction Details',style: TextStyle(fontSize: 16),),
              SizedBox(height: 7,),
              TextField(
                controller: _noteC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: 'Please Enter Transaction Details',
                    helperText: 'Please Pay to our Bank Accounts and share details here',
                    labelText: 'Transaction Details',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    prefixText: ' ',
                    suffixStyle: const TextStyle(color: Colors.green)),
              ),



              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(
                    child: ElevatedButton(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      onPressed: () async{

                        print(USERTOKEN);

                        await UserRechargeWallet.requestThenResponsePrint( USERTOKEN,  _gatewayC.text  + _noteC.text).then((value) async {
                          print(value.statusCode);
                          print("mmmmmm :   ");
                          print(value.body);
                          final Map parsed = json.decode(value.body);

                          if(value.statusCode==200){
                            SnackbarDialogueHelper().showSnackbarDialog(context, 'successfully Recharged', Colors.green);
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

                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 45),
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
              ),


            ],
          ),
        ),
      ),
    );
  }
}
