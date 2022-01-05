import 'dart:convert';
import 'dart:io';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/controllers/user/signin_controller.dart';
import 'package:care_plus/controllers/user/user_edit_img_ctrl.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/signIn_model/signIn_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/signIn_response.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/setUp_Profile/setUp_Profile.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NewImageUploadPage extends StatefulWidget {

  final int page;

  const NewImageUploadPage({Key? key, required this.page}) : super(key: key);

  @override
  _NewImageUploadPageState createState() => _NewImageUploadPageState();
}

class _NewImageUploadPageState extends State<NewImageUploadPage> {

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        // if(widget.page == 1){
        //   Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        // }
        // else{
        //   Navigator.push(context,MaterialPageRoute(builder: (context) => SetupProfile()));
        // }
        return true;
      },
      child: Scaffold(
          appBar: myAppBar("Upload Image", null),
          body: imageUploadSection()
      ),
    );
  }



  bool visibleUpload = false;
  late File img;
  File? imageFile;
  Widget _setImageView() {
    if (imageFile != null) {
      return Image.file(imageFile!, width: 250, height: 250);
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text( "Please Select an Image",
            style: TextStyle(
                fontSize: 16
            ),
          ),
        ),
      );
    }
  }
  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: Text("fromWhereDoYouWantToTakePhoto"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: ListTile(
                        title: Text('Gallery'),
                        isThreeLine: true,
                        subtitle: Text('From Gallery'),
                        leading: Icon(Icons.slideshow),
                        trailing: Text('Select'),
                      ),


                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: ListTile(
                        title: Text('Camera'),
                        isThreeLine: true,
                        subtitle: Text('From Camera'),
                        leading: Icon(Icons.camera_alt_outlined),
                        trailing: Text('Select'),
                      ),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }
  void _openGallery(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 50, maxWidth: 400,maxHeight: 700);
    this.setState(() {
      imageFile = File(picture!.path);
      visibleUpload = true;
    });
    Navigator.of(context).pop();
  }
  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 50);
    this.setState(() {
      imageFile = File(picture!.path);
      visibleUpload = true;
    });
    Navigator.of(context).pop();
  }







  imageUploadSection() {
    return Container(
      child: ListView(
        children: [



          _setImageView(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    setState(() {
                      _showSelectionDialog(context);
                      // visibleUpload = true;
                    });
                  },
                  child: Text(
                    "Select Image",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              Visibility(
                visible: visibleUpload,
                child: RaisedButton(
                  color: Colors.green,
                  child: Text("Upload Image", style: TextStyle(
                      color: Colors.white
                  ),),
                  onPressed: () async {
                    // String presName = presNameC.text;
                    // String presType = presTypeC.text;
                    if ((imageFile != null)) {
                      await UserRegisterControllerExtraImg.postRequestRegistrationExtra(context, imageFile, USERTOKEN)
                          .then((value) async {
                        print(value.statusCode);
                        print(value.statusMessage);
                        print(value);
                        if(value.statusCode==200){
                          SigninModel myInfo = new SigninModel(
                              mobile: USERNAME, password: USERPASS);
                          await SigninController.requestThenResponsePrint(myInfo)
                              .then((value) async {
                            print(value.statusCode);
                            print(value.body);
                            //EasyLoading.dismiss();
                            if (value.statusCode == 200) {
                              SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                              setState(() {
                                var reobj = SignInResponse.fromJson(json.decode(value.body));
                                var loginobject = reobj.data.user;

                                print(loginobject.image);
                                SIGNINGRESPONSE = loginobject;
                                print(loginobject.token);
                                sharedPreferences.setString("token", loginobject.token);

                                sharedPreferences.setString("mobile", USERNAME);
                                sharedPreferences.setString("password", USERPASS);
                              });
                              if(widget.page == 2){
                                SnackbarDialogueHelper().showSnackbarDialog(context, "Image Uploaded successfully",Colors.green);
                                return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    SetupProfile()), (Route<dynamic> route) => false);
                              }else{
                                SnackbarDialogueHelper().showSnackbarDialog(context, "Image Uploaded successfully",Colors.green);
                                return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    BottomNevigation()), (Route<dynamic> route) => false);
                              }
                            } else {
                              SnackbarDialogueHelper().showSnackbarDialog(context, "Image not Uploaded",Colors.red);
                              // return LoginController.requestThenResponsePrint(jsonData);
                              Navigator.push(context,MaterialPageRoute(builder: (context) => SetupProfile()),);
                            }

                          });

                        }



                      });
                    } else {
                      // BasicFunctions.showAlertDialogTOView(context, 'Warning', 'Select an image to upload');
                      // BasicFunctions.showAlertDialogTOView(context,
                      //     "Warning",
                      //     "Please Select an Image to Upload");
                    }
                  },
                ),
              )
            ],
          ),



        ],
      ),
    );
  }


// Future<void> signInAgain(BuildContext context) async {
//   //EasyLoading.show(status: 'loading...');
//
//   DoctorSignInModel myInfo = new DoctorSignInModel(mobile: PHONE_NUMBER, password: PASSWORD, );
//   await DoctorSigninController.requestThenResponsePrint(myInfo).then((value) async {
//     print(value.statusCode);
//     print(value.body);
//     final Map parsed = json.decode(value.body);
//
//     final loginobject = User.fromJson(parsed);
//     DOCTOR_INITIAL = loginobject;
//     print(loginobject.token);
//     print(loginobject.token);
//
//
//
//     USERTOKEN = loginobject.token;
//     // sharedPreferences.setString("token", loginobject.accessToken);
//     //EasyLoading.dismiss();
//     if (value.statusCode == 200) {
//       PHONE_NUMBER = PHONE_NUMBER;
//       PASSWORD = PASSWORD;
//       return Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => BottomNevigation()),
//       );
//     } else {
//       // return LoginController.requestThenResponsePrint(jsonData);
//       AlertDialogueHelper().showAlertDialog(
//           context, 'Warning', 'Please recheck email and password');
//     }
//   });
// }
}





//if (value.statusCode == 200) {
//                           // Navigator.pop(context,"Bar");
//                           if(widget.page == 1){
//                             Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()),);
//                           }
//                           else{
//                             Navigator.push(context,MaterialPageRoute(builder: (context) => SetupProfile()),);
//                           }
//
//
//                         }