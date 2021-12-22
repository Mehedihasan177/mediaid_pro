import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/controllers/user/rating_controller.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/responses_from_test_file/responses/user/upcoming_appointment_list_responses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class GiveReview extends StatefulWidget {
  UpcomingAppointment appointment;
  GiveReview({Key? key, required this.appointment}) : super(key: key);

  @override
  _GiveReviewState createState() => _GiveReviewState();
}

class _GiveReviewState extends State<GiveReview> {

  TextEditingController _textExperience =
  TextEditingController();

  double ratingTogo = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Give A Review'),
        backgroundColor: Color(0xFF1CBFA8),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          // shrinkWrap: true,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('How You Enjoyed the session?',style: TextStyle(fontSize: 16),),
              RatingBar.builder(
                initialRating: ratingTogo,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                  setState(() {
                    ratingTogo=rating;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _textExperience,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    hintText: 'Tell us about your Experience',
                    helperText: 'Feel free to share about us to improve our services',
                    labelText: 'Your Experience',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    prefixText: ' ',
                    suffixStyle: const TextStyle(color: Colors.green)),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Container(
                    child: ElevatedButton(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () async {
                        // EasyLoading.show(status: 'loading...');


                        Map data1 = {
                          'rating': "${ratingTogo}",
                          'comment': "${_textExperience.text}",
                          'doctor_id': "${widget.appointment.doctorId}",
                          'appointment_schedule_id': "${widget.appointment.id}",

                        };
                        print("data1");
                        print(data1);
                        //EasyLoading.show(status: 'loading...');
                        await UserRatingController.requestThenResponsePrint(
                            USERTOKEN, data1)
                            .then((value) async {
                          print(value.statusCode);
                          print(USERTOKEN);
                          print(value.body);
                          //final Map parsed = json.decode(value.body);

                          //final doctorProfile = update.Data.fromJson(parsed);

                          print(value.statusCode);
                          print(value.body);
                          //EasyLoading.dismiss();
                          if (value.statusCode == 200) {

                            SnackbarDialogueHelper().showSnackbarDialog(
                                context, 'successfully ratted', Colors.green);
                            // return Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => BottomNevigation()),
                            // );
                          } else {
                            SnackbarDialogueHelper().showSnackbarDialog(
                                context,
                                value.body
                                    .replaceAll('"', ' ')
                                    .replaceAll('{', ' ')
                                    .replaceAll('}', ' ')
                                    .replaceAll('[', ' ')
                                    .replaceAll(']', ' '),
                                Colors.red);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 39),
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
              ),
            ],
        ),
      ),
    );
  }
}
