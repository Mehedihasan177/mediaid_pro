import 'package:care_plus/responses/firebase_model.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'lib/pages/call_page.dart';

class CallingScreen extends StatefulWidget {
  final CallModule callModule;
  const CallingScreen({Key? key, required this.callModule}) : super(key: key);

  @override
  _CallingScreenState createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: CircleAvatar(
                  radius: 88,
                  backgroundColor: Colors.deepOrangeAccent,
                  child: ClipOval(
                      child: Image.network(
                    widget.callModule.doctorImage,
                    fit: BoxFit.fill,
                    width: 170,
                    height: 170,
                  )),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(widget.callModule.doctor,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),

                      )),

                  Container(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text("Calling...")),


                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 40.0,
                          textDirection: TextDirection.ltr,
                          semanticLabel:
                              'Reject', // Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          callNow(widget.callModule.appointmentId);
                        });
                      },
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 40.0,
                          textDirection: TextDirection.ltr,
                          semanticLabel:
                              'Accept', // Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void callNow(channelName) {
    setState(() async {
      // String channelName = "abcdefg";
      if (channelName.isNotEmpty) {
        // await for camera and mic permissions before pushing video page
        //await _handleCameraAndMic();
        await _handleCameraAndMic(Permission.camera);
        await _handleCameraAndMic(Permission.microphone);
        // push video page with given channel name
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallPage(channelName),//testing
          ),
        );
      }
    });
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }





}
