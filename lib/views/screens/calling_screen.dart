import 'package:flutter/material.dart';

class CallingScreen extends StatefulWidget {
  const CallingScreen({Key? key}) : super(key: key);

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
                      child: Image.asset(
                    "images/doc.jpg",
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
                      child: Text("Dr. Jems",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),

                      )),

                  Container(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text("Dentist")),


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
                    child: CircleAvatar(
                      radius: 37,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 40.0,
                        textDirection: TextDirection.ltr,
                        semanticLabel:
                            'Icon', // Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      radius: 37,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 40.0,
                        textDirection: TextDirection.ltr,
                        semanticLabel:
                            'Icon', // Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
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
}
