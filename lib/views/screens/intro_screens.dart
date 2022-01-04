import 'package:care_plus/views/screens/signInPage/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SingInPage()),
    );
  }

  Widget _buildFullscrenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration =  PageDecoration(

      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top: 50),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('care+_Logo.png', 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          autofocus: true,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(350, 59),
            primary: Color(0xFF1CBFA8),
          ),
          child: const Text(
            'Let\s go right away!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),

      pages: [
        PageViewModel(
          titleWidget: Text('Thousands of Doctors',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          bodyWidget:Text('Access thousands of Doctors instantly. You can easily contact with the doctors and contact for your needs.',style: TextStyle(fontSize: 18),),
          image: _buildImage('online_doctor.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Text('Live Talk With Doctors',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          bodyWidget:Text('Easily connect with doctors and start video chat for your better treatment & Prescription.',style: TextStyle(fontSize: 18),),
          image: _buildImage('online_doctor1.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Text('Get Appointment',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          bodyWidget:Text('Book an appointment with doctor, Chat with doctor via appointment letter Get consultant.xt',style: TextStyle(fontSize: 18),),
          image: _buildImage('online_doctor2.png'),
          decoration: pageDecoration,
        ),

      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

