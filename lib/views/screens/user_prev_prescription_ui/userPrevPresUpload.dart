import 'dart:io';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/helper/basic_functions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class UserPrevPres{
  //this class is for make understand how it works actually

  static Future<dio.Response> requestThenResponsePrint(BuildContext context, token, name, type, File img) async {
    // It starts showing the progressbar


    // This string will contain the ResponseResult
    String printedRes = "";
    // This is a a callof global veriable
    String domain = apiDomainRoot;
    // This is a url for the request
    var url = '$domain/api/user/report-prescription';
    // This is the structure how we are posting data

    String fileName = img.path.split('/').last;

    FormData data1 = FormData.fromMap({
      'name': '${name}',
      'type': '${type.toString().toLowerCase()}',
      "file": await MultipartFile.fromFile(
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



    // After geting the response we need to split all the json formatted data. Otherwise
    if(response.statusCode==200){
    BasicFunctions.showAlertDialogTOView(context, "Successful", "You have successfully added your health attachment");
    print(response);
    // currentState.push( MaterialPageRoute(builder: (context) =>PatientPrescriptionUploadPage(toShow:true)));
    }

    else if(response.statusCode==401){
      BasicFunctions.showAlertDialogTOView(context, "Warning", "Please select a type of upload");
    }

    else{
      BasicFunctions.showAlertDialogTOView(context, "${response.statusCode}", "${response.data}");
    }
    return response;
  }

}