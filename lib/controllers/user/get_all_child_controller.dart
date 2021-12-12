import 'package:care_plus/constents/constant.dart';
import 'package:http/http.dart' as http;
class GetAllChildController{

  static Future<http.Response> requestThenResponsePrint(String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/user/child';

    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}