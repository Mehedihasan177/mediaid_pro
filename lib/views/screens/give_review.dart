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


            ],
        ),
      ),
    );
  }
}
