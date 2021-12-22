import 'dart:convert';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/models/user_update_model.dart';
import 'package:http/http.dart' as http;
class UserRatingController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(String token, Map dataMap) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user/reviews';

    var body = json.encode(dataMap);

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: body,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}