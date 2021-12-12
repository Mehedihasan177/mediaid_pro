import 'package:care_plus/all_model_from_test_file/models/miscellaneous/sms_model.dart';
import 'package:care_plus/constents/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class SMSController{

  static Future<http.Response> requestThenResponsePrint(BuildContext context, MiscellaneousSMS miscellaneousSMS, String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/send-sms/01621092630/msg';

    Map doctorcashout = {
      'contact': "${miscellaneousSMS.contact}",
      'msg': "${miscellaneousSMS.msg}",
    };
    var response = await http.post(Uri.parse(url), body: doctorcashout,
        headers: {
          "Accept": "application/json",
        }
    );
    return response;
  }

}