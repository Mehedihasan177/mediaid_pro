
import 'dart:convert';

import 'package:care_plus/responses/firebase_model.dart';
import 'package:care_plus/views/screens/calling_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'firebase_services.dart';

int gone = 0;
void goForCallorNot(String id,context) {
  // DatabaseReference db = databaseReference.child(id.toString());
  // print(db.path);

  FirebaseDatabase().reference().child('callModule').child("Patient").child('$id').once().then((valuem) {

    DataSnapshot snapshot = valuem.snapshot;

    if (snapshot.value != null) {
      CallModule? value = CallModule.fromJson(jsonDecode(jsonEncode(snapshot.value)));
      print(jsonEncode(value));
      DateTime date = DateTime.parse(value.time.toString());
      print(date);
      DateTime now = DateTime.now();
      int diff = now.difference(date).inMinutes;
      print("diff");
      print(diff);
      if (diff < 5) {
        if (value.callStatus == "called") {
          database.createStatusData(value.patientId, value.appointmentId, value.doctor,value.doctorImage,'ringing');
          // goForCall(value["Doctor"], value["DoctorImage"], value["appointment_id"],value["patient_id"]);
          // callNow(id.toString());

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CallingScreen(callModule: value),//testing
            ),
          );

        }
      }
    }
    else {
      print('no call bro');
    }

    // value.forEach((key,values) {
    //   // print("jsonEncode(values['patient_id'])");
    //   // print(jsonEncode(values['patient_id']));
    //   if(values['patient_id'].toString()=="${id}"){
    //     print(values["Doctor"]);
    //     print(values["appointment_id"]);
    //     print(values["call_status"]);
    //
    //     if(values['call_status']=='called'){
    //       goForCall(values["Doctor"], values["appointment_id"]);
    //     }
    //   }
    //
    // });
  });
}


