import 'package:care_plus/responses_from_test_file/responses/user/upcoming_appointment_list_responses.dart';
import 'package:flutter/material.dart';

class GiveReview extends StatefulWidget {
  UpcomingAppointment appointment;
  GiveReview({Key? key, required this.appointment}) : super(key: key);

  @override
  _GiveReviewState createState() => _GiveReviewState();
}

class _GiveReviewState extends State<GiveReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Give A Review'),
      ),
      body: Container(
        child: Column(

        ),
      ),
    );
  }
}
