import 'package:care_plus/constents/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class UserGetSlotDoctor{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(
      BuildContext context, String token, int doctorID) async {
    // It starts showing the progressbar

    // This string will contain the ResponseResult
    // String printedRes = "";
    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = Uri.parse('$domain/api/user/doctor7slot/$doctorID');
    print(url);

    print(token);
    // Here we are getting the response
    var response = await http.get(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    // print("DocID: "+DoctorID.toString());
    // print(response);

    // After getting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }
}
