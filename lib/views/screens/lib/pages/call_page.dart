

import 'package:care_plus/views/screens/lib/widgets/call_function.dart';
import 'package:flutter/material.dart';


class CallPage extends StatefulWidget {
  final String channelName;
  CallPage(this.channelName);
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          VideoCall(widget.channelName),
        ],
      ),
    );
  }
}
