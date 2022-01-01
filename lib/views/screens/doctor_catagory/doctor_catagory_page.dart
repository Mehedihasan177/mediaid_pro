import 'package:care_plus/constents/global_appbar.dart';
import 'package:care_plus/constents/no_data_found.dart';
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
  TextEditingController searchC = TextEditingController();
  @override
  void initState() {
    searchC = TextEditingController();
    searchKey = searchC.text;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
          appBar: myAppBar("Search Doctor", null),
          body: ListView(
            children: [
              Center(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: searchC,
                    onChanged: onSearch,
                    onSubmitted: onSearch,
                    style: TextStyle(color: Colors.black),
                    scrollPadding: EdgeInsets.all(10),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 14),
                      border: InputBorder.none,
                      hintText: 'Search doctor category',
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
                  child: widget.informationslist.isEmpty
                      ? Center(
                          child: NoDataFoundSize("images/doctor_catagory.png",
                              "Doctor Category not Available"),
                        )
                      : GridView.builder(
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (1 / 0.8),
                            crossAxisCount: 3,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 9.0,
                          ),
                          itemCount: widget.informationslist.length,
                          itemBuilder: (context, index) {
                            //Diseasesinformation information = informationslist[index];

                            if (searchKey.length == 0) {
                              return Findspecialist(
                                  widget.informationslist[index],
                                  context,
                                  index);
                            } else {
                              if (widget.informationslist[index].name
                                  .toLowerCase()
                                  .contains(searchKey)) {
                                return Findspecialist(
                                    widget.informationslist[index],
                                    context,
                                    index);
                              } else {
                                return Container();
                              }
                            }
                          },
                        ),
                ),
              ),
            ],
          )),
    );
  }

  String searchKey = '';
  void onSearch(String value) {
    setState(() {
      searchKey = value;
    });
  }
}
