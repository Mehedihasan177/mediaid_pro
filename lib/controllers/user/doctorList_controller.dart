import 'package:care_plus/constents/constant.dart';
import 'package:http/http.dart' as http;
class DoctorListController{

  static Future<http.Response> requestThenResponsePrint(String token,String cat) async {

    String domain = apiDomainRoot;

    var url = '$domain/api/user/doctor-list/$cat';
    print('calling api');
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