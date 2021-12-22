import 'dart:io';
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class BodyScan extends StatefulWidget {
  @override
  _BodyScanState createState() => _BodyScanState();
}

enum PlayerState { stopped, playing, paused }

class _BodyScanState extends State<BodyScan> {
  String mp3Uri = "";
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
    print('initState Happened');

    _loadsound();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('this is a demo alert diolog'),
            actions: <Widget>[
              TextButton(
                  child: const Text('stop'),
                  onPressed: _stopsound
              ),
              TextButton(
                  child: const Text('stop'),
                  onPressed:  _stopsound
              ),
            ],
          ),
        )
    );

  }

}
