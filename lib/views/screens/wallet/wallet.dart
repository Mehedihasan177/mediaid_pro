import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/constents/no_data_found.dart';
import 'package:care_plus/controllers/user/user_wallet_controller.dart';
import 'package:care_plus/controllers/user/user_wallet_log_controller.dart';
import 'package:care_plus/data/wallet_data/wallet_data.dart';
import 'package:care_plus/models/ui_model/wallet_model/wallet_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/wallet_log_responses.dart';
import 'package:care_plus/responses_from_test_file/responses/user/wallet_response.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/profile/profile.dart';
import 'package:care_plus/views/widgets/money_wallet_wdget/money_wallet_wdget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../recharge_screen.dart';

class walletUi extends StatefulWidget {
  const walletUi({Key? key}) : super(key: key);

  @override
  _walletUiState createState() => _walletUiState();
}

class _walletUiState extends State<walletUi> {
  List<WalletLogResponses> moneyWallet = [];

  String userbalance = '0';

  @override
  void initState() {
    // TODO: implement initState
    getWalletBal();
    getTrxHist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        //Navigator.pop(context, true);
        // Navigator.push<void>(
        //   context,
        //   MaterialPageRoute<void>(
        //     builder: (BuildContext context) =>  BottomNevigation(),
        //   ),
        // );
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Wallet", null),
        body: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            
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
                          "\$${userbalance}",
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
                          Navigator.push(context,MaterialPageRoute(builder: (context) => RechargeScreen()));

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
                    alignment: Alignment.center,
                    child: moneyWallet.isEmpty ? Center(
                      child: NoDataFoundSize("images/transaction_history.png", "No Transaction History"),
                    ) : ListView.builder(
                      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      reverse: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: moneyWallet.length,
                      itemBuilder: (context,index) {
                      return MoneyWallet(moneyWallet[index]);
                      },
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

  void getWalletBal() {
    UserWalletController.requestThenResponsePrint(USERTOKEN).then((value) {
      setState(() {
        print(value.statusCode);
        print(value.body);

        if(value.statusCode==200){
          Map<String, dynamic> decoded = json.decode("${value.body}");
          var walletbal = WalletResponse.fromJson(decoded);
          print(walletbal.data);
          userbalance = walletbal.data;
        }

      });
    });
  }


  void getTrxHist() {

    WalletLogController.requestThenResponsePrint(USERTOKEN).then((value) {
      setState(() {
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listTrx = decoded['data'];
        print(decoded['data']);
        moneyWallet =
            listTrx.map((model) => WalletLogResponses.fromJson(model)).toList();

        print('moneyWallet');
        print(moneyWallet);



      });
    });
  }
}


