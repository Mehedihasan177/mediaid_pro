import 'package:care_plus/data/wallet_data/wallet_data.dart';
import 'package:care_plus/models/ui_model/wallet_model/wallet_model.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/profile/profile.dart';
import 'package:care_plus/views/widgets/money_wallet_wdget/money_wallet_wdget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class walletUi extends StatefulWidget {
  const walletUi({Key? key}) : super(key: key);

  @override
  _walletUiState createState() => _walletUiState();
}

class _walletUiState extends State<walletUi> {
  List<Wallet_Model> moneyWallet = List.of(wallet_data);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    splashColor: Colors.transparent,
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Wallet",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 20),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                              "AVAILABLE BALANCE",
                              style: TextStyle(fontSize: 16),
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 20),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "\$520",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 20),
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.07,
                    // width: MediaQuery.of(context).size.width * 0.9,
                    //color: Color(0xF60D72),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             CardDemo(Health_History[index])));
                      },
                      child: ElevatedButton(

                        child: Text(
                          "Add Money",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        onPressed: () async {
                          // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Otp()));

                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          // maximumSize: const Size(50, 25),
                          primary: Color(0xFF1CBFA8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    // decoration: BoxDecoration(
                    //   //color: Color(0xF60D72),
                    //     borderRadius: BorderRadius.circular(18)),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text("Recent", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
            ),


            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    height: 750,
                    child: ListView.builder(
                      //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: moneyWallet.length,
                        itemBuilder: (context,index) {
                          //var information = carePlushPrescriptionList[index];
                          return MoneyWallet(moneyWallet[index]);

                        }
                    ),
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


