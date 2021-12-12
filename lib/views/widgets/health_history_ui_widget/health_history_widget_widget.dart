import 'package:care_plus/models/ui_model/health_histoy/health_history_model.dart';
import 'package:flutter/material.dart';

Widget Health_History_List(Health_History health_history) => Card(
  child: Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Image.asset(health_history.image,
          height: 90,
          width: 90,
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                health_history.name
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                  health_history.lab_report_type
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  color: Color(0xFF1CBFA8),
                  size: 15,
                ),
                SizedBox(width: 5,),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                      health_history.date
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                      health_history.time
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
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
                "View",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () async {
                // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Otp()));

              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(0, 25),
                // maximumSize: const Size(50, 25),
                primary: Color(0xFF1CBFA8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
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
);