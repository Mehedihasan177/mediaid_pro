import 'package:care_plus/models/ui_model/notification_model/notification_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/notification_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget NotificationWidget(NotificationRes notification) => Padding(
  padding: const EdgeInsets.only(left: 10, right: 10),
  child:   Card(
    child: Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10),
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Text(notification.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              )
          ),
          SizedBox(height: 10,),
          // Container(
          //     alignment: Alignment.centerLeft,
          //     child: Text(notification.body.replaceAll("Your password has been changed successfully", "")
          //             .replaceAll(".", ""))
          // ),
          SizedBox(height: 10,),
          Container(
              alignment: Alignment.centerLeft,
              child: Text(DateFormat("dd-MMMM-yyyy").format(notification.createdAt))
          ),

        ],
      ),
    ),
      ),
);
