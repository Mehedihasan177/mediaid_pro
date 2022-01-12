import 'dart:convert';
import 'dart:io';

import 'package:care_plus/constents/constant.dart';
import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/controllers/user/signin_controller.dart';
import 'package:care_plus/helper/snackbarDialouge.dart';
import 'package:care_plus/models/image_selection_dropDOwn.dart';
import 'package:care_plus/models/signIn_model/signIn_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/signIn_response.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/screens/user_prev_prescription_ui/userPrevPresUpload.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadReportPresPage extends StatefulWidget {
  const UploadReportPresPage({Key? key}) : super(key: key);

  @override
  _UploadReportPresPageState createState() => _UploadReportPresPageState();
}

class _UploadReportPresPageState extends State<UploadReportPresPage> {
  TextEditingController textReasons = TextEditingController();
  String myCurrentPres = 'Prescription';
  final navigatorKey = GlobalKey<NavigatorState>();
  SelectionOption value = selectionOption.first;
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
          appBar: myAppBar("Upload Health History", null),
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
        child: Column(
          children: [

            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(
                    "Select a document type",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0, bottom: 20),
                  child: Container(
                    // alignment: Alignment.center,
                    // height:
                    //     MediaQuery.of(context).size.height * 0.067,
                    width: MediaQuery.of(context).size.width * 0.87,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<SelectionOption>(
                      isExpanded: true,
                      value: value, // currently selected item
                      items: selectionOption
                          .map((item) => DropdownMenuItem<SelectionOption>(
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        value: item,
                      ))
                          .toList(),
                      onChanged: (value) => setState(() {
                        this.value = value!;
                        print(this.value.title);
                        print(this.value.selectiontype);
                        myCurrentPres = this.value.selectiontype;
                      }),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.notes,
                        size: 20,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Health Report title",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextField(
                    controller: textReasons,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black),
                    //scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.all(20),
                      hintText: "Enter health report title",

                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text( "Please Select an Image",
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
          ],
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


          /// put Document name
          /// put Document Type here

          SizedBox(height: 20),
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


                    if ((imageFile != null)) {
                      await UserPrevPres.requestThenResponsePrint(context,USERTOKEN, textReasons.text, myCurrentPres, imageFile )
                          .then((value) async {
                        print(value.statusCode);
                        print(value.statusMessage);
                        print(value);
                        if(value.statusCode==200){
                          SnackbarDialogueHelper().showSnackbarDialog(context, "Image Uploaded successfully",Colors.green);
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              BottomNevigation()), (Route<dynamic> route) => false);

                        }



                      });
                    } else {
                      SnackbarDialogueHelper().showSnackbarDialog(context, 'Image can not get uploaded', Colors.red);

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

}
