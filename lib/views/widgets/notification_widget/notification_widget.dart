import 'package:care_plus/models/ui_model/notification_model/notification_model.dart';
import 'package:flutter/material.dart';

Widget NotificationWidget(NotificationModel notification) => Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: Column(
          children: [

            Card(
              child: Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 20),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 10, top: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(notification.date)),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.blue.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.notification_important_rounded,
                                color: Colors.blue.withOpacity(0.9),
                                size: 35,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Serial Reminder",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        notification.serial_remainder,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                color: Colors.blue.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.watch_later_outlined,
                                color: Colors.deepOrange.withOpacity(0.6),
                                size: 35,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Appointment Reminder",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        notification.appointment_remainder,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Divider(
                            color: Colors.black,
                          ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                color: Colors.blue.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.credit_card_outlined,
                                color: Colors.blue.withOpacity(0.7),
                                size: 35,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Serial Reminder",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        notification.serial_remainder,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
