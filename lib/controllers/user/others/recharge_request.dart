import 'package:care_plus/constents/constant.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class UserRechargeWallet {
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(token, trxNote) async {
    // It starts showing the progressbar


    // This string will contain the ResponseResult
    // String printedRes = "";
    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user/bkash-recharge';
    // This is the structure how we are posting data
    Map data1 = {'trx_id': '$trxNote'};
    print(data1);

    // Here we are getting the response
    var response = await http.post(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        body: data1);



    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }
}
