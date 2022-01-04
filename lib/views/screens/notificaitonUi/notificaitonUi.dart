import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/constents/shimmer.dart';
import 'package:care_plus/controllers/user/notification_controller.dart';
import 'package:care_plus/controllers/user/notification_delete_controller.dart';
import 'package:care_plus/data/notification_data/notification_data.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/ui_model/notification_model/notification_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/notification_response.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/profile/profile.dart';
import 'package:care_plus/views/widgets/notification_widget/notification_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:care_plus/constents/no_data_found.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationRes> notification = [];
int val = 0;
  _getNotification() async {


    NotificationController.requestThenResponsePrint( USERTOKEN).then((value) {
      setState(() {
        val = 1;
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


            val == 0 ? shimmer(context) :Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.centerLeft,
                    height: 780,
                    child: notification.isEmpty
                        ? Center(
                        child: NoDataFound("images/no_notification.png", "No Notification Found")
                    )
                        : ListView.builder(
                        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: notification.length,
                        itemBuilder: (context,index) {
                          return NotificationWidget(notification[index], index);
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
  Widget NotificationWidget(NotificationRes notification, int index) =>
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child:   Slidable(
          key: UniqueKey(),
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // A pane can dismiss the Slidable.

            // All actions are defined in the children parameter.
            children:  [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (v){
                  cancelThisAppointment(notification.id.toString(),index);
                  print("this is hot day");
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),

            ],
          ),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue.withOpacity(0.2),
                      ),
                      child: Icon(
                        Icons.notification_important_rounded,
                        color: Colors.blue.withOpacity(0.9),
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                notification.title,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                notification.body,
                                style: const TextStyle(
                                  fontSize: 9,
                                  //fontWeight: FontWeight.bold
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(DateFormat("dd-MMM-yyyy")
                                      .format(notification.createdAt))),
                              const Text(" || "),
                              Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(DateFormat.jms().format(
                                      DateTime.parse(
                                          notification.createdAt.toString())))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          endActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),
            //key: ValueKey(1),
            // A pane can dismiss the Slidable.
            // dismissible: DismissiblePane(onDismissed: () {}),

            // All actions are defined in the children parameter.
            children:  [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (v){
                  cancelThisAppointment(notification.id.toString(),index);
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),

            ],
          ),

        )

      );


  void cancelThisAppointment(String appointmentID, int index) {
    NotificationDeleteController.requestThenResponsePrint(
        USERTOKEN, appointmentID)
        .then((value) {
      setState(() {
        print(value.statusCode);
        print(value.body);
        if (value.statusCode == 200) {
          setState(() {
            // Navigator.pop(context);
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNevigation()));
            notification.removeAt(index);
          });
        }
      });
    });
  }
}


