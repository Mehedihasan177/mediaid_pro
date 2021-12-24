import 'dart:io';

import 'package:audioplayer/audioplayer.dart';
import 'package:care_plus/responses/firebase_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'lib/pages/call_page.dart';

class CallingScreen extends StatefulWidget {
  final CallModule callModule;
  const CallingScreen({Key? key, required this.callModule}) : super(key: key);

  @override
  _CallingScreenState createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {

  String mp3Uri = "assets/music.mp3";
  AudioPlayer player = AudioPlayer();
  void _playsound(String mp3uri) {
    player.play(mp3Uri);
  }

  void _stopsound() {
    player.stop();
  }

  void _loadsound() async {
    final ByteData data = await rootBundle.load("assets/music.mp3");
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/music.mp3"');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3Uri = tempFile.uri.toString();
    _playsound(mp3Uri);
  }


  @override
  void initState() {
    // TODO: implement initState
    _loadsound();
    super.initState();
  }

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
                        _stopsound();
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
                          _stopsound();
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
