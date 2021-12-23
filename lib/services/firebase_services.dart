import 'package:firebase_database/firebase_database.dart';

Database database = Database();
var databaseReference =
    FirebaseDatabase().reference().child('callModule').child("Patient");

class Database {
  dynamic result = "";
  // void createData(String pID, String aID, String doctorName) {
  //   FirebaseDatabase()
  //       .reference()
  //       .child('callModule')
  //       .child("Patient")
  //       .child(pID)
  //       .once()
  //       .then((DataSnapshot snapshot) {
  //     // print("hehehehehehehhehe");
  //     // print(snapshot.value);
  //     //   Map<dynamic, dynamic> values=snapshot.value;
  //     //   print(values["Name"]);
  //
  //     if (snapshot.value == null) {
  //       print("hehehehehehehhehe");
  //       // print("value is" + snapshot.value);
  //       databaseReference.child("$pID").set({
  //         'appointment_id': "$aID",
  //         'call_status': "called",
  //         'patient_id': "$pID",
  //         'Doctor': "$doctorName",
  //         'Time':DateTime.now().toString(),
  //       });
  //     } else {
  //       print("hohohohohohohohoho");
  //       // print("value is" + snapshot.value);
  //     }
  //   });
  // }

  void createData(String pID, String aID, String doctorName, String doctorImage){
    FirebaseDatabase.instance.reference().child('callModule').child('Patient').child(pID)
        .set({
              'appointment_id': "$aID",
              'call_status': "called",
              'patient_id': "$pID",
              'Doctor': "$doctorName",
              'DoctorImage': "$doctorImage",
              'Time':DateTime.now().toString(),
    });
  }
  void changeCallStatus(String pID,String callStatus){
    FirebaseDatabase.instance.reference().child('callModule').child('Patient').child(pID).child('call_status').set(callStatus);
  }



  deleteDataCallClose(String pID) {
    FirebaseDatabase.instance.reference().child('callModule').child('Patient').child(pID).remove();
  }
  deleteData() {
    // databaseReference.remove();
    print('Warning I was searching this action');
  }



  void createStatusData(String pID, String aID, String doctorName, String doctorImage, String strtJoin){

    DatabaseReference dbRef = FirebaseDatabase.instance.reference().child('callLog').child('Appointments').child(aID);
    dbRef.child('appointment_id').set("$aID");
    dbRef.child('call_status').set("$strtJoin");
    dbRef.child('patient_id').set("$pID");
    dbRef.child('Doctor').set("$doctorName");
    dbRef.child('DoctorImage').set("$doctorImage");
    dbRef.child('$strtJoin').set(DateTime.now().toString());

    // FirebaseDatabase.instance.reference().child('callLog').child('Appointments').child(pID)
    //     .set({
    //   'appointment_id': "$aID",
    //   'call_status': "called",
    //   'patient_id': "$pID",
    //   'Doctor': "$doctorName",
    //   'DoctorImage': "$doctorImage",
    //   '$strtJoin':DateTime.now().toString(),
    // });
  }


}
