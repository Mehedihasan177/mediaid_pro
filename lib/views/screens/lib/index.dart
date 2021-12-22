import 'package:care_plus/views/screens/lib/pages/call_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {

            String channelName = "abcdefg";
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
          },
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Icon(
              Icons.call,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
