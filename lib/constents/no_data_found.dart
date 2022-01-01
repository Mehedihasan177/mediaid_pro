

import 'package:flutter/material.dart';
NoDataFound(img, msg) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(img,
        height: 180,
          width: 180,
        ),
        SizedBox(
          height: 17,
        ),
        Text(msg, style: TextStyle(
          fontSize: 20,
          color: Color(0xFF1CBFA8)
        ),)
      ],
    ),
  );
}


NoDataFoundSize(img, msg) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(img,
          height: 120,
          width: 120,
        ),
        SizedBox(
          height: 17,
        ),
        Text(msg, style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1CBFA8)
        ),)
      ],
    ),
  );
}


NoDataFoundSmallSize(img, msg) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(img,
          height: 75,
          width: 75,
        ),
        SizedBox(
          height: 17,
        ),
        Text(msg, style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1CBFA8)
        ),)
      ],
    ),
  );
}