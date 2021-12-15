import 'package:care_plus/constents/constant.dart';
import 'package:http/http.dart' as http;
class UpcomingAppointmentController{

  static Future<http.Response> requestThenResponsePrint(String token) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/user/appointment/upcoming';

    var response = await http.get(Uri.parse(url),
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );
    return response;
  }

}