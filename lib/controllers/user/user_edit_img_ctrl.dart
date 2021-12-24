import 'dart:io';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/helper/basic_functions.dart';
import 'package:care_plus/helper/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;




class UserRegisterControllerExtraImg{
  //this class is for make understand how it works actually

  static Future<dio.Response> postRequestRegistrationExtra(BuildContext context, img,token) async {



    // This string will contain the ResponseResult
    String printedRes = "";
    // This is a a callof global veriable

    String domain = apiDomainRoot;
    var url = '$domain/api/user-profile-update';


    // This is the structure how we are posting data

    String fileName = img.path.split('/').last;

    FormData data1 = FormData.fromMap({

      "image": await MultipartFile.fromFile(
        img.path,
        filename: fileName,
      ),
    });
    Dio dio = new Dio();
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer ${token}";
    var response = await dio.post(url, data: data1,
      options: Options(
          followRedirects: false,
          validateStatus: (status) { return status! < 500; }
      ),
    );
    print("this is the responses: ");
    print(response);


    print(USERTOKEN);
    // After geting the response we need to split all the json formatted data. Otherwise
    if(response.statusCode==200){
      // BasicFunctions.showAlertDialogTOView(context, "Successful", "You have successfully added your health attachment");
      print("response");
      print(response);

      var decoded = response.data;
      print(response.statusMessage);
      print(response.data);
      // print("token: "+decoded['data']['token']);

      SharedPref sharedPref = new SharedPref();
      //BasicFunctions.showAlertDialogTOView(context, "Success", "Image uploaded successfully");
      // currentState.push( MaterialPageRoute(builder: (context) =>PatientPrescriptionUploadPage(toShow:true)));
    }else{
      // BasicFunctions.showAlertDialogTOView(context, "${response.statusCode}", "${response.data}");
      //BasicFunctions.showAlertDialogTOView(context, "Warning", "You are trying to upload a too big image");
    }

    return response;
  }

}