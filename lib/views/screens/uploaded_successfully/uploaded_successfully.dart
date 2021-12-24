import 'package:care_plus/views/screens/upload_documents/upload_documents.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class UploadedSuccessfully extends StatefulWidget {
  const UploadedSuccessfully({Key? key}) : super(key: key);

  @override
  _UploadedSuccessfullyState createState() => _UploadedSuccessfullyState();
}

class _UploadedSuccessfullyState extends State<UploadedSuccessfully> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM   kk:mm:ss').format(now);
    return WillPopScope(

      onWillPop: () async {
        Navigator.push(context,MaterialPageRoute(builder: (context) => UploadDocument()));
        return true;
      },
      child: Scaffold(
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
                child: Text("Uploaded Successfully",
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
      ),
    );
  }
}
