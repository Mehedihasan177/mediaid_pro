import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/responses_from_test_file/responses/user/create_appointment_schedule.dart';
import 'package:http/http.dart' as http;
class CreateAppointmentScheduleController{
  //this class is for make understand how it works actually

  static Future<http.Response> requestThenResponsePrint(CreateAppointmentReq createAppointmentSchedule, String token) async {

    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user/appointment-schedule';

    Map data1 = {
      // 'UserID': "${createAppointmentSchedule.userId}",
      'doctor_id': "${createAppointmentSchedule.doctorId}",
      'appointment_slot_id': "${createAppointmentSchedule.appointmentSlotId}",
      'date': "${createAppointmentSchedule.date}",

    };

    print(data1);
    print(token);

    // Here we are getting the response
    var response = await http.post(Uri.parse(url), body: data1,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        }
    );

    // After geting the response we need to split all the json formatted data. Otherwise
    // BasicFunctions.showAlertDialog(context, "${response.statusCode}", "${response.body}");
    return response;
  }

}

class CreateAppointmentReq {

  late String userId;
  late String doctorId;
  late int appointmentSlotId;
  late String date;

  CreateAppointmentReq(
      this.userId, this.doctorId, this.appointmentSlotId, this.date);
}