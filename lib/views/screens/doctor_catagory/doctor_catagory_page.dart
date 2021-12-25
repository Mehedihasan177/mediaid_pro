import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/data/specialist_information/getInformation.dart';
import 'package:care_plus/models/ui_model/specialist_information/information_model.dart';
import 'package:care_plus/responses_from_test_file/responses/user/specialization_responses.dart';
import 'package:care_plus/views/screens/navbar_pages/bottomnevigation.dart';
import 'package:care_plus/views/widgets/find_by_specialist_widget/find_by_specialist_widget.dart';
import 'package:flutter/material.dart';

class DoctorCatagory extends StatefulWidget {
  List<SpecializationResponse> informationslist;
  DoctorCatagory({Key? key, required this.informationslist}) : super(key: key);

  @override
  _DoctorCatagoryState createState() => _DoctorCatagoryState();
}

class _DoctorCatagoryState extends State<DoctorCatagory> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        appBar: myAppBar("Search Doctor", null),
        body: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 10, top: 20, bottom: 20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 14),
                    border: InputBorder.none,
                    hintText: "Search doctor catagory",
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 15),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: Color(0xFF1CBFA8),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 0),
              child: Container(
                height: 693,
                //color: Colors.red,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (1 / 0.8),
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 9.0,

                  ),
                  itemCount: widget.informationslist.length,
                  itemBuilder: (context, index) {
                    //Diseasesinformation information = informationslist[index];
                    return Findspecialist(widget.informationslist[index], context, index);
                  },
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
