import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/create_appointment_schedule_controller.dart';
import 'package:care_plus/controllers/user/user_get_doctor_slots.dart';
import 'package:care_plus/data/doctor_appointment_data/doctor_about_and_appointment_data.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/doctor_7_slots_model.dart';
import 'package:care_plus/models/ui_model/doctor_appointment_model/doctor_about_and_appointment_model.dart';
import 'package:care_plus/views/screens/confirm_appointment/confirm_appointment.dart';
import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/doctor_about_and_appointment_widget/doctor_about_and_appointment_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DoctorAppointment extends StatefulWidget {
  final String name,
      specialization,
      hospital_name,
      fee,
      rating,
      experience,
      about,
      image,
      department,
      chamber,
      address,
      visitingfee;
  final int docID;

  const DoctorAppointment({
    Key? key,
    required this.name,
    required this.specialization,
    required this.hospital_name,
    required this.fee,
    required this.rating,
    required this.experience,
    required this.about,
    required this.image,
    required this.department,
    required this.address,
    required this.chamber,
    required this.visitingfee,
    required this.docID
  }) : super(key: key);

  @override
  _DoctorAppointmentState createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  List<DoctorAppointmentModel> doctorAppointment =
      List.of(doctor_appointment_data);

  @override
  void initState() {
    // TODO: implement initState
    fetchDoctorSlots(widget.docID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

          children: [
            // Row(
            //   children: [
            //     Flexible(
            //       child: Container(
            //         //padding: EdgeInsets.only(left: 20),
            //         alignment: Alignment.centerLeft,
            //         height: 750,
            //         child: ListView.builder(
            //           //controller: PageController(viewportFraction: 0.3),
            //             scrollDirection: Axis.vertical,
            //             itemCount: doctorAppointment.length,
            //             itemBuilder: (context,index) {
            //               //var information = carePlushPrescriptionList[index];
            //               return DoctorAboutAppointmentWidget(
            //                   doctorAppointment[index], context);
            //
            //             }
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0, right: 0, bottom: 10),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 20),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                height: 120,
                                width: 120,
                                child: ClipRRect(
                                  child: Image.network(
                                    '$apiDomainRoot/images/${widget.image}',
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceEvenly,
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            widget.name,
                                            style: TextStyle(
                                                color: Color(0xff1CBFA8),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "\$ " + widget.fee,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 17,
                                                //fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Container(
                                      height: 25,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    widget.specialization,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 1.0),
                                                  child: Container(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(" at ")),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 0),
                                                  child: Container(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(
                                                        widget.hospital_name.replaceAll("null", "No hospital name"),
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                  ),

                                                ),
                                              ],
                                            ),
                                          ]),
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Ratings: " + widget.rating)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      designPortion(),
                      designPortion1(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40, left: 40),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.6),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(40),
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.people_outline,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 40),
                                        child: Text(
                                          widget.department,
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          widget.experience.replaceAll("null", "").replaceAll("years", "")+" years",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),




                            ],
                          ),


                          ///about doctor
                          Padding(
                            padding: EdgeInsets.only(top: 60, left: 30),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "About Doctor",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.about.replaceAll(
                                        "null", "Haven't any description"),
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                      fontSize: 16
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                ///address
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Address",
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.5),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10  ),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          widget.address,
                                          style: TextStyle(
                                              color: Colors.black.withOpacity(0.5),
                                              fontSize: 16,
                                              //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                  ///chamber

                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Chamber",
                                          style: TextStyle(
                                              color: Colors.black.withOpacity(0.5),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10  ),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            widget.chamber.replaceAll("null", "Not yet"),
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(0.5),
                                              fontSize: 16,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),





                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Available date and time",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),


                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  height: 100.0,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: slotWithDate.length,
                                      itemBuilder: (BuildContext context,int index){
                                        return cardBuilder(slotWithDate[index],index);
                                      }
                                  ),
                                ),



                                Container(
                                  padding: EdgeInsets.only(top: 10,right: 20),
                                  alignment: Alignment.centerLeft,
                                  child: TextFormField(
                                    controller: appointmentForC,
                                    cursorColor: Colors.black,
                                    decoration: new InputDecoration(
                                        // border: InputBorder.none,
                                        // focusedBorder: InputBorder.none,
                                        // enabledBorder: InputBorder.none,
                                        // errorBorder: InputBorder.none,
                                        // disabledBorder: InputBorder.none,
                                        contentPadding:
                                        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                        hintText: "Appointment For"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                child: const Text(
                                  "Book Appointment",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () async {

                                  if(selectedIndex!=-1){

                                    CreateAppointmentReq createAppointmentSchedule = CreateAppointmentReq(
                                        SIGNINGRESPONSE.id,
                                        slotWithDate[selectedIndex].timeslotlist.doctorId,
                                        slotWithDate[selectedIndex].timeslotlist.id,
                                        slotWithDate[selectedIndex].date,
                                    );

                                    CreateAppointmentScheduleController.requestThenResponsePrint(createAppointmentSchedule,appointmentForC.text, USERTOKEN).then((value) {
                                      setState(() {
                                        print(value.statusCode);
                                        if(value.statusCode==200){
                                          SnackbarDialogueHelper().showSnackbarDialog(context, 'Appointment Created Successfully', Colors.green);
                                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                              BottomNevigation()), (Route<dynamic> route) => false);
                                        }
                                      });
                                    });


                                  }else{
                                    SnackbarDialogueHelper().showSnackbarDialog(context, 'Please Select a Time Slot', Colors.red);
                                  }

                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(350, 59),
                                  maximumSize: const Size(350, 59),
                                  primary: Color(0xFF1CBFA8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  //color: Color(0xF60D72),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextEditingController appointmentForC = new TextEditingController(text: 'Appointment For ');

  designPortion() => Row(
        children: [
          Flexible(
            child: Container(
              height: 550,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff1CBFA8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  topRight: Radius.circular(63),
                ),
              ),
            ),
          ),
        ],
      );

  designPortion1() => Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                height: 590,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(63),
                    topRight: Radius.circular(63),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  void fetchDoctorSlots(doctorID) {
    UserGetSlotDoctor.requestThenResponsePrint(context, USERTOKEN, doctorID).then((value) {
      print(value.statusCode);
      // print(value.body);

      setState(() {

      });



      Map<String, dynamic> decoded = json.decode(value.body);
      for (var date in decoded.keys) {
        List Doctor7SlotResponseJSON = json.decode(json.encode(decoded[date]));
        timeSlotList = Doctor7SlotResponseJSON.map((m) => new Doctor7SlotResponse.fromJson(m)).toList();
        print(timeSlotList);
        for (var slot in timeSlotList) {
          slotWithDate.add(SlotsWithDate(slot,date));
        }
      }
      print(slotWithDate);



    });
  }

  List<Doctor7SlotResponse> timeSlotList = [];
  List<SlotsWithDate> slotWithDate = [];
  int selectedIndex = -1;

  Widget cardBuilder(SlotsWithDate slotWithDate, int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex=index;
          SnackbarDialogueHelper().showSnackbarDialog(context, 'Appointment on ${slotWithDate.timeslotlist.day} ${slotWithDate.date} is Selected', Colors.blue);
        });
      },
      child: Card(
        color: selectedIndex==index?Colors.green:Colors.white,
        child: Container(
          // height: 150,
          width: 150,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(slotWithDate.timeslotlist.day,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Text(DateFormat('dd MMM yyyy').format(DateFormat('yyyy-MM-dd').parse(slotWithDate.date))),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(slotWithDate.timeslotlist.startTime))),
                  Text(' - '),
                  Text(DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(slotWithDate.timeslotlist.endTime))),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }


}



class SlotsWithDate{
  late Doctor7SlotResponse timeslotlist;
  late String date;

  SlotsWithDate(this.timeslotlist, this.date);
}
