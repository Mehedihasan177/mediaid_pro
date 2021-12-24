import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/models/signIn_model/signIn_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/signIn_response.dart';
import 'package:care_plus/services/call_check_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SigninController{

  static Future<http.Response> requestThenResponsePrint(SigninModel signinController) async {

    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user-login';

    Map login = {
      'mobile': "${signinController.mobile}",
      'password': "${signinController.password}",
    };

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: login,
        headers: {
          "Accept": "application/json",
        }
    );
    if(response.statusCode==200) {
      gone = 0;
      final Map<String, dynamic> parsed = json.decode(response.body);
      final loginobject = SignInResponse.fromJson(parsed);
      print(loginobject.data.token);
      USERTOKEN = loginobject.data.token;
      USERID = loginobject.data.user.id;
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      sharedPreferences.setString("token", loginobject.data.token);
      print(sharedPreferences.getString("token"));
      SIGNINGRESPONSE = loginobject.data.user;

      // PHONE_NUMBER = doctorSignInModel.mobile;
      // PASSWORD = doctorSignInModel.password;

    }
    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}