import 'package:care_plus/all_model_from_test_file/models/miscellaneous/child_health_id_model.dart';
import 'package:care_plus/constents/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class ChildByHealthIdController{

  static Future<http.Response> requestThenResponsePrint(BuildContext context, String token, ChildHealthIDModel childHealthIDModel) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/user/child-by-health-id';

    Map doctorrecharge = {
      'health_id': "${childHealthIDModel.health_id}",
    };
    var response = await http.post(Uri.parse(url), body: doctorrecharge,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}