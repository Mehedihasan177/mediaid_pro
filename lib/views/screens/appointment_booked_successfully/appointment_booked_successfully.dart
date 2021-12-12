import 'package:care_plus/views/screens/confirm_appointment/confirm_appointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentBookedSuccessfully extends StatefulWidget {
  const AppointmentBookedSuccessfully({Key? key}) : super(key: key);

  @override
  _AppointmentBookedSuccessfullyState createState() => _AppointmentBookedSuccessfullyState();
}

class _AppointmentBookedSuccessfullyState extends State<AppointmentBookedSuccessfully> {


  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM   kk:mm:ss').format(now);
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/success.png"),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text("Congratulations",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Your appointment booked Dr. Merry",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                      color: Color(0xFF1CBFA8)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text("S.K Abir has been booked successfully",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1CBFA8)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text("On  "  + formattedDate,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1CBFA8)
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
