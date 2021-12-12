import 'package:care_plus/views/screens/home_pages/home_page.dart';
import 'package:care_plus/views/screens/splash_screen/splash_Screen.dart';
import 'package:flutter/material.dart';

void main() {
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
     );
   }
 }
