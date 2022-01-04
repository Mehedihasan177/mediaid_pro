import 'package:care_plus/views/screens/calling_screen.dart';
import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/splash_screen/splash_Screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  GestureBinding.instance?.resamplingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
 class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   _MyAppState createState() => _MyAppState();
 }

 class _MyAppState extends State<MyApp> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
         body: SplashScreen(),
       ),
       builder: EasyLoading.init(),
     );
   }
 }
