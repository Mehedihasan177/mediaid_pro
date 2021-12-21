import 'package:care_plus/constents/constant.dart';
import 'package:http/http.dart' as http;
class AppointmentCencelController{

  static Future<http.Response> requestThenResponsePrint(String token, String id ) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/user/appointment-schedule-cancel/$id';

    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}