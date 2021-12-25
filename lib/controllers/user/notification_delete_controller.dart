import 'package:care_plus/constents/constant.dart';
import 'package:http/http.dart' as http;
class NotificationDeleteController{

  static Future<http.Response> requestThenResponsePrint(String token,  id) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/user/delete-notification/$id';
    print(url);

    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}