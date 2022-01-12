//import 'package:agora_group_calling/utils/appID.dart';
import 'dart:io';
import 'dart:typed_data';


import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/views/screens/lib/utils/settings.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

// import 'app_bar.dart';
class VideoCall extends StatefulWidget {
  final String channelName;
  VideoCall(this.channelName);
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {

  final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;
  late RtcEngine _engine;

  @override
  void dispose() {
    // clear users
    _users.clear();
    // _stopsound();
    // destroy sdk
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }


  @override
  void initState() {
    // _loadsound();
    super.initState();
    // initialize agora sdk
    print(widget.channelName);
    initialize();
  }

  Future<void> initialize() async {
    if (APP_ID.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }

    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await _engine.enableWebSdkInteroperability(true);
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(height:1920, width: 1080);
    // configuration.dimensions = VideoDimensions(1280, 720);
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(APP_ID, widget.channelName, null, 0);
  }

  /// Create agora sdk instance and initialize
  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create(APP_ID);
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
  }

  /// Add agora event handlers
  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      setState(() {
        final info = 'onError: $code';
        _infoStrings.add(info);
      });
    }, joinChannelSuccess: (channel, uid, elapsed) {
      setState(() {
        final info = 'onJoinChannel: $channel, uid: $uid';
        _infoStrings.add(info);
      });
    }, leaveChannel: (stats) {
      setState(() {
        _infoStrings.add('onLeaveChannel');
        _users.clear();
      });
    }, userJoined: (uid, elapsed) {
      setState(() {
        final info = 'userJoined: $uid';
        _infoStrings.add(info);
        _users.add(uid);
      });
    }, userOffline: (uid, elapsed) {
      setState(() {
        final info = 'userOffline: $uid';
        _infoStrings.add(info);
        _users.remove(uid);
      });
    }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
      setState(() {
        final info = 'firstRemoteVideo: $uid ${width}x $height';
        _infoStrings.add(info);
      });
    }));
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    if (ClientRole.Broadcaster == ClientRole.Broadcaster) {
      list.add(RtcLocalView.SurfaceView());
    }
    _users.forEach((int uid) => list.add(RtcRemoteView.SurfaceView(uid: uid)));
    return list;
  }

  /// Remote video view wrapper
  Widget _videoView(view) {
    // return Container(
    //     height: 680,
    //     child: view
    // );
    return Container(
        height: MediaQuery.of(context).size.height * 0.897,  //10% of screen height
        width: MediaQuery.of(context).size.width * 1,   //80% of screen width
        child: view
    );
  }

  /// Local video view row wrapper
  Widget _localVideoView(view) {
    return Container(
      height: 150,
      width: 120,
      child: view,
      margin: EdgeInsets.all(10),

    );
  }

  /// Video layout wrapper
  Widget _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
      // _playsound(mp3Uri);
        return Container(
            child: Column(
              children: <Widget>[_videoView(views[0])],
            )
        );
      case 2:
      // _stopsound();
      // var userType = Provider.of<BaseProvider>(context, listen: false);
      // userType.getUserType();

        return Container(

            child: Stack(
              children: <Widget>[
                _videoView(views[1]),
                Align(
                    alignment: Alignment(0.99, -0.99),
                    child:_localVideoView(views[0])
                ),

              ],
            ));
      default:
    }
    return Container();
  }


  /// Info panel to show logs
  Widget _panel() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: ListView.builder(
            reverse: true,
            itemCount: _infoStrings.length,
            itemBuilder: (BuildContext context, int index) {
              if (_infoStrings.isEmpty) {
                return Text("");
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          _infoStrings[index],
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Toolbar layout
  Widget _toolbar() {
    // if (ClientRole.Broadcaster == ClientRole.Broadcaster) return Container();
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            // onPressed: () => dispose(),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            child: Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
    // Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));

  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$APPNAME Calling'),
        backgroundColor: Color(0xFF1CBFA8),
      ),
      body: Container(
        child: Center(
          child: Stack(
            children: <Widget>[
              _viewRows(),
              // _panel(),
              _toolbar(),
              // _panel(),
            ],
          ),
        ),
      ),
    );
  }










//*************************************************

// String mp3Uri = "";
// AudioPlayer player = AudioPlayer();

// void _playsound(mp3Uri) {
//   setState(() {
//   player.play(mp3Uri);
//   });
// }

// void _stopsound() {
//   print('strr');
//   setState(() {
//   player.stop();
//
//   });
// }

// void _loadsound() async {
//   final ByteData data = await rootBundle.load("assets/calling.mp3");
//   Directory tempDir = await getTemporaryDirectory();
//   File tempFile = File('${tempDir.path}/calling.mp');
//   await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
//   mp3Uri = tempFile.uri.toString();
//   // _playsound(mp3Uri);
// }





//*************************************************
}