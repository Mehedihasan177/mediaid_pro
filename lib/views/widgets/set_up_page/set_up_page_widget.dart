import 'package:flutter/material.dart';

bool checkbox = false;
Widget SetUpPage() => ListView(
    children:[
      Padding(
        padding: const EdgeInsets.only(top: 30, left: 20),
        child: Text("Set up your profile",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 20),
        child: Text("Update your profile picture or renew informaton",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Stack(
            children:
            [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    //flex: 1,
                    fit: FlexFit.loose,
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 130,
                        width: 120,
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.07),
                        ), //BoxDecoration
                      ),
                    ), //Container
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Center(child: Image.asset("images/camera.png",
                height: 30,
                  width: 30,
                )),
              )
            ]
        ),
      ),

      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 33),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 17,
                  width: 17,
                  child: Image(image: AssetImage("assets/gender.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Gender",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Checkbox(
                      value: checkbox,
                      shape: CircleBorder(),
                      onChanged: (bool? value) {
                        // setState(() {
                        //   checkbox = value!;
                        // });
                      },
                    ),
                    // SizedBox(width: 20,),
                    Text("Male", style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Checkbox(
                      value: checkbox,
                      shape: CircleBorder(),
                      onChanged: (bool? value) {
                        // setState(() {
                        //   checkbox = value!;
                        // });
                      },
                    ),
                    // SizedBox(width: 10,),
                    Text("Female", style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

    ]
);