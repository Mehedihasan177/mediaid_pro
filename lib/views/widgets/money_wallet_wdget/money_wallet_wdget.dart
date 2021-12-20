import 'package:care_plus/models/ui_model/wallet_model/wallet_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/wallet_log_responses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget MoneyWallet(WalletLogResponses moneyWallet) =>
    Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10,
        right: 10),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(moneyWallet.paymentNote,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                            ),
                          ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Icon(Icons.calendar_today_rounded, size: 15,),
                          ),
                          SizedBox(width: 5,),
                          Text(moneyWallet.paymentGateway),
                          SizedBox(width: 10,),
                          Text(DateFormat("dd MMM yyyy || hh:mm a").format(moneyWallet.createdAt)),
                          //Text(carePlushLabReportList.time),
                        ],
                      ),

                    ],
                  ),
                ),

                Text('\$'+moneyWallet.amount.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );