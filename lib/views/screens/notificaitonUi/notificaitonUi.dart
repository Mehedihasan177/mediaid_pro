import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/controllers/user/notification_controller.dart';
import 'package:care_plus/data/notification_data/notification_data.dart';
import 'package:care_plus/models/ui_model/notification_model/notification_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/notification_response.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/profile/profile.dart';
import 'package:care_plus/views/widgets/notification_widget/notification_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationRes> notification = [];

  _getNotification() async {


    NotificationController.requestThenResponsePrint( USERTOKEN).then((value) {
      setState(() {
        print(value.body);
        Map<String, dynamic> decoded = json.decode("${value.body}");
        Iterable listNotification = decoded['data'];
        print(decoded['data']);
        notification =
            listNotification.map((model) => NotificationRes.fromJson(model)).toList();
        print(notification);

      });
    });
  }


  @override
  void initState() {
    _getNotification();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Notification", null),
        body: ListView(
          children: [


            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.centerLeft,
                    height: 780,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: notification.length,
                        itemBuilder: (context,index) {
                          return NotificationWidget(notification[index]);
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


