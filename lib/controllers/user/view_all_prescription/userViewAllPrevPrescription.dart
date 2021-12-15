import 'package:care_plus/constents/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class UserViewAllPres {
  static Future<http.Response> requestThenResponsePrint(
      BuildContext context, String token) async {
    // It starts showing the progressbar
    // await pr.show();

    // This string will contain the ResponseResult
    // String printedRes = "";
    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user/report-prescription';
    print(url);

    print(token);
    // Here we are getting the response
    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }
}
