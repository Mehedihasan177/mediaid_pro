import 'package:care_plus/data/profile_data/profile_data.dart';
import 'package:care_plus/models/ui_model/profile_model/profile_model.dart';
import 'package:care_plus/views/screens/change_password/change_password.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/notificaitonUi/notificaitonUi.dart';
import 'package:care_plus/views/screens/splash_screen/splash_Screen.dart';
import 'package:care_plus/views/screens/wallet/wallet.dart';
import 'package:care_plus/views/widgets/profile_widget_widget/profile_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Profile_Model> profileModel = List.of(profile_data);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Profile', style: TextStyle(
            color: Colors.black
        ),

        ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [

            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    // height: 750,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                        shrinkWrap: true,
                        //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: profileModel.length,
                        itemBuilder: (context,index) {
                          return Profile_Page(profileModel[index], context);
                        }
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20,),

            GridView.count(
                  childAspectRatio: (1 / .55),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    GridTile(
                      child: GestureDetector(
                        child: new Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Container(
                                  // padding: EdgeInsets.only(left: 20, ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Wallet',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        left: 20,
                                      ),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Quick payment',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, right: 10),
                                    child: Icon(
                                      Icons.account_balance_wallet,
                                      color: Colors.black.withOpacity(0.5),
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => walletUi()));
                        },
                      ),
                    ),

                    GridTile(
                      child: new Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Container(
                                // padding: EdgeInsets.only(left: 20, ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Invite',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Invite friends',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  child: Icon(
                                    Icons.card_giftcard,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GridTile(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => NotificationPage()));
                        },
                        child: new Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Container(
                                  // padding: EdgeInsets.only(left: 20, ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Notification',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        left: 20,
                                      ),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Notifications',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, right: 10),
                                    child: Icon(
                                      Icons.notifications_on_outlined,
                                      color: Colors.black.withOpacity(0.5),
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GridTile(
                      child: new Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Container(
                                // padding: EdgeInsets.only(left: 20, ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Let us help you',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  child: Icon(
                                    Icons.message_outlined,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GridTile(
                      child: new Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Container(
                                // padding: EdgeInsets.only(left: 20, ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Change Language',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Change Language',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  child: Icon(
                                    Icons.vpn_lock_outlined,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    GridTile(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ChangePassword()));
                        },
                        child: new Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Container(
                                  // padding: EdgeInsets.only(left: 20, ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Change Password',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        left: 20,
                                      ),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Change Password',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, right: 10),
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.black.withOpacity(0.5),
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GridTile(
                      child: new Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Container(
                                // padding: EdgeInsets.only(left: 20, ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'FAQs',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Quick Answers',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  child: Icon(
                                    Icons.announcement,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GridTile(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => SplashScreen()));

                        },
                        child: new Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 20,
                                ),
                                child: Container(
                                  // padding: EdgeInsets.only(left: 20, ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 5,
                                        left: 20,
                                      ),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Logout',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, right: 10),
                                    child: Icon(
                                      Icons.logout,
                                      color: Colors.black.withOpacity(0.5),
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),

          ],
        ),
      ),
    );
  }
}
