import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/models/ui_model/health_histoy/health_history_model.dart';
// import 'package:care_plus/models/ui_model/health_histoy/health_history_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/report_presctiption_responses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import '../../webscreen.dart';

Widget Health_History_List(Health_History health_history, BuildContext context) => Padding(
  padding: const EdgeInsets.only(top: 10),
  child:   Card(

    child: Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(

        children: [

          ///circle image

          Expanded(

            flex: 2,

            child: Padding(

              padding: const EdgeInsets.only(left: 10),

              child: Container(

                height: 80.0,

                width: 80.0,

                decoration: BoxDecoration(

                  image: DecorationImage(

                    image: NetworkImage(

                      health_history.image,
                    ),

                    fit: BoxFit.fill,

                  ),

                  shape: BoxShape.circle,

                ),

              ),

            ),

          ),



          Expanded(

            flex: 5,

            child: Column(

              children: [

                Container(

                  alignment: Alignment.topLeft,

                  child: Text(

                      health_history.name

                  ),

                ),

                Container(

                  alignment: Alignment.topLeft,

                  child: Text(

                      health_history.lab_report_type

                  ),

                ),

                SizedBox(

                  height: 25,

                ),

                Row(

                  children: [

                    Icon(

                      Icons.calendar_today_rounded,

                      color: Color(0xFF1CBFA8),

                      size: 15,

                    ),

                    SizedBox(width: 5,),

                    Container(

                      alignment: Alignment.topLeft,

                      child: Text(

                          health_history.date

                      ),

                    ),

                    Container(

                      padding: EdgeInsets.only(left: 10),

                      alignment: Alignment.topLeft,

                      child: Text(

                          health_history.time

                      ),

                    ),

                  ],

                ),

              ],

            ),

          ),

          Expanded(

            flex: 2,

            child: Padding(

              padding: const EdgeInsets.all(8.0),

              child: Container(

                // height: MediaQuery.of(context).size.height * 0.07,

                // width: MediaQuery.of(context).size.width * 0.9,

                //color: Color(0xF60D72),

                child: GestureDetector(

                  onTap: () {

                    // Navigator.push(

                    //     context,

                    //     MaterialPageRoute(

                    //         builder: (context) =>

                    //             CardDemo(Health_History[index])));

                  },

                  child: ElevatedButton(



                    child: Text(

                      "View",

                      style: TextStyle(color: Colors.white, fontSize: 15),

                    ),

                    onPressed: () async {



                      String url = health_history.image;

                      if(health_history.lab_report_type.toString().toLowerCase()=='care+ prescription'){

                        url =  "$apiDomainRoot/api/e-prescription/" + health_history.id.toString();

                      }

                      _launchURL(context,url);

                      // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Otp()));



                    },

                    style: ElevatedButton.styleFrom(

                      minimumSize: const Size(0, 25),

                      // maximumSize: const Size(50, 25),

                      primary: Color(0xFF1CBFA8),

                      shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(40)),

                    ),

                  ),

                ),

                // decoration: BoxDecoration(

                //   //color: Color(0xF60D72),

                //     borderRadius: BorderRadius.circular(18)),

              ),

            ),

          ),

        ],

      ),
    ),

  ),
);



void _launchURL(BuildContext context,String url) async {
  try {
    await launch(
      url,
      customTabsOption: CustomTabsOption(

        extraCustomTabs: const <String>[
          // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
          'org.mozilla.firefox',
          // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
          'com.microsoft.emmx',
        ],
      ),
      safariVCOption: SafariViewControllerOption(
        preferredBarTintColor: Theme.of(context).primaryColor,
        preferredControlTintColor: Colors.white,
        barCollapsingEnabled: true,
        entersReaderIfAvailable: false,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      ),
    );
  } catch (e) {
    // An exception is thrown if browser app is not installed on Android device.
    debugPrint(e.toString());
  }
}
