import 'package:care_plus/models/ui_model/wallet_model/wallet_model.dart';
import 'package:flutter/material.dart';

Widget MoneyWallet(Wallet_Model moneyWallet) =>
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
                          child: Text(moneyWallet.money_add,
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
                          Text(moneyWallet.date),
                          SizedBox(width: 10,),
                          Text(moneyWallet.time),
                          //Text(carePlushLabReportList.time),
                        ],
                      ),

                    ],
                  ),
                ),

                Text(moneyWallet.money_history,
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