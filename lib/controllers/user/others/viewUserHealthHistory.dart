import 'package:care_plus/constents/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class DocViewUserHistory{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(id) async {


    // This string will contain the ResponseResult
    String printedRes = "";
    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user/allPrescription/$id';
    print(url);

    // Here we are getting the response
    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          // "Authorization": "Bearer ${token}"
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}



