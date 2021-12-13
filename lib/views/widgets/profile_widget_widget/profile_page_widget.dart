import 'package:care_plus/models/ui_model/profile_model/profile_model.dart';
import 'package:care_plus/views/screens/update_profile/update_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Profile_Page(Profile_Model profile_model, context) => Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      profile_model.image,
                      height: 70,
                      width: 70,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(profile_model.name),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset("images/emergency_number.png"),
                            SizedBox(width: 5),
                            Text("6959 14235 9"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Image.asset('images/edit_icon.png'),
                iconSize: 30,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => UpdateProfile()));
                },
              ),
            ),
          ],
        ),
      ),
    );

//     Card(
//       child: Row(
//   children: [
//       Padding(
//         padding: const EdgeInsets.only(left: 30),
//         child: Expanded(
//           child: CircleAvatar(
//             radius: 40.0,
//             foregroundImage: AssetImage(profile_model.image,
//             ),
//           )
//         ),
//       ),
//       Expanded(
//         child: Column(
//           children: [
//
//             Padding(
//               padding: const EdgeInsets.only(left: 30),
//               child: Container(
//                 alignment: Alignment.centerLeft,
//                 child: Text(profile_model.name),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30),
//                   child: Image.asset("images/emergency_number.png"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Container(
//                     alignment: Alignment.topLeft,
//                     child: Text("6959 14235 9"),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       // FlatButton(
//       //     onPressed: (){},
//       //   Image(
//       //   AssetImage("images/emergency_number.png"),
//       //   // color: Color(0xFF3A5A98),
//       // ),
//       // )
//       Container(
//         alignment: Alignment.topRight,
//         child: IconButton(
//           icon: Image.asset('images/edit_icon.png'),
//           iconSize: 30,
//           onPressed: () {
//             Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => UpdateProfile()));
//           },
//         ),
//       )
//   ],
// ),
//     );