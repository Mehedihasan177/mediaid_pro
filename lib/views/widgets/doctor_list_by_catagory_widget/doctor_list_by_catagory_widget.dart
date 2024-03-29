// import 'package:care_plus/constents/constant.dart';
// import 'package:care_plus/models/ui_model/doctor_list_by_catagory_model/doctor_list_by_catagory_model.dart';
// import 'package:care_plus/responses_from_test_file/responses/user/doctor_list_responses.dart';
// import 'package:care_plus/views/screens/doctor_list_by_catagory/doctor_list_by_catagory.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
//
// Widget DoctorListByCatagoryWidget(Datum doctorlistbycatagory, BuildContext context, String name) {
//   print('$apiDomainRoot/images/${doctorlistbycatagory.image}');
//   return GestureDetector(
//     child: Card(
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: Image.network('$apiDomainRoot/images/${doctorlistbycatagory.image}',
//
//               height: 90,
//               width: 90,
//             ),
//           ),
//           Container(
//             alignment: Alignment.centerRight,
//             child: Text(name,
//               style: TextStyle(
//                   color: Color(0xFF1CBFA8)
//               ),
//             ),
//           ),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: Text(doctorlistbycatagory.name),
//                     ),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(right: 0),
//                           child: Container(
//                             alignment: Alignment.centerRight,
//                             child: Text(doctorlistbycatagory.fee,
//                               style: TextStyle(
//                                   color: Color(0xFF1CBFA8)
//                               ),
//                             ),
//                           ),
//                         ),
//                         PopupMenuButton(
//                           itemBuilder: (_) => <PopupMenuEntry>[
//                             const PopupMenuItem(
//                               child: Text('Reshedule'),
//                               value: 'hot',
//                             ),
//                             const PopupMenuItem(
//                               child: Text('Set Reminder'),
//                             ),
//                             const PopupMenuItem(
//                               child: Text('Cancel'),
//                             ),
//                           ],
//
//                         )
//                       ],
//                     ),
//
//                   ],
//                 ),
//                 Container(
//                   height: 25,
//                   child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(doctorlistbycatagory.mobile),
//                             ),
//                             Container(
//                               alignment: Alignment.centerLeft,
//                               child: Text(doctorlistbycatagory.specialization),
//                             ),
//                           ],
//                         ),
//                       ]
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Container(
//                     //     alignment: Alignment.bottomLeft,
//                     //     child: Text(DateFormat('dd/MM/yyyy hh:mm a').format(doctorlistbycatagory.createdAt.toString()))),
//                     Text(" | "),
//                     Container(
//                         alignment: Alignment.bottomLeft,
//                         child: Text(doctorlistbycatagory.updatedAt.toString())),
//                     Row(
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             Icons.call,
//                           ),
//                           iconSize: 20,
//                           color: Color(0xFF1CBFA8),
//                           splashColor: Color(0xFF1CBFA8),
//                           onPressed: () {},
//                         ),
//                         IconButton(
//                           icon: Icon(
//                             Icons.message,
//                           ),
//                           iconSize: 20,
//                           color: Color(0xFF1CBFA8),
//                           splashColor: Color(0xFF1CBFA8),
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//
//     ),
//     onTap: (){
//       //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => DoctorListByCatagory()));
//
//     },
//   );
// }
//
