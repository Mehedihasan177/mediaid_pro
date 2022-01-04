

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

shimmer(context) {
  return SizedBox(
      width:  MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height,
      child: Shimmer.fromColors(
        baseColor: Colors.black.withOpacity(0.1),
        highlightColor: Colors.white,
        child: ListView.builder(
            itemCount: 16,
            itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 5, right: 5, top: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          width:  MediaQuery.of(context).size.width,
                          height: 50.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:  MediaQuery.of(context).size.width,
                              height: 10.0,
                              color: Colors.white,
                              child: Card(
                                child: Text("hotboy"),
                              ),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              width:  MediaQuery.of(context).size.width,
                              height: 10.0,
                              color: Colors.white,
                              child: Card(
                                child: Text("hotboy"),
                              ),
                            ),
                            SizedBox(height: 4,),
                            Container(

                              width:  MediaQuery.of(context).size.width - 300,
                              height: 10.0,
                              color: Colors.white,
                              child: Card(
                                child: Text("hotboy"),
                              ),
                            ),

                          ],
                        ),
                      )
                    ]
                )
            )
        ),
      )
  );
}


shimmerOneLine(context) {
  return SizedBox(
      width:  MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height,
      child: Shimmer.fromColors(
        baseColor: Colors.black.withOpacity(0.1),
        highlightColor: Colors.white,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 5, right: 5, top: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          width:  MediaQuery.of(context).size.width,
                          height: 50.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:  MediaQuery.of(context).size.width,
                              height: 10.0,
                              color: Colors.white,
                              child: Card(
                                child: Text("hotboy"),
                              ),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              width:  MediaQuery.of(context).size.width,
                              height: 10.0,
                              color: Colors.white,
                              child: Card(
                                child: Text("hotboy"),
                              ),
                            ),
                            SizedBox(height: 4,),
                            Container(

                              width:  MediaQuery.of(context).size.width - 300,
                              height: 10.0,
                              color: Colors.white,
                              child: Card(
                                child: Text("hotboy"),
                              ),
                            ),

                          ],
                        ),
                      )
                    ]
                )
            )
        ),
      )
  );
}

shimmerThreeLine(context) {
  return SizedBox(
      width:  MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height,
      child: Shimmer.fromColors(
        baseColor: Colors.black.withOpacity(0.1),
        highlightColor: Colors.white,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 5, right: 5, top: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          width:  MediaQuery.of(context).size.width,
                          height: 50.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:  MediaQuery.of(context).size.width,
                              height: 10.0,
                              color: Colors.white,
                              child: Card(
                                child: Text("hotboy"),
                              ),
                            ),
                            SizedBox(height: 4,),
                            Container(
                              width:  MediaQuery.of(context).size.width,
                              height: 10.0,
                              color: Colors.white,
                              child: Card(
                                child: Text("hotboy"),
                              ),
                            ),
                            SizedBox(height: 4,),
                            Container(

                              width:  MediaQuery.of(context).size.width - 300,
                              height: 10.0,
                              color: Colors.white,
                              child: Card(
                                child: Text("hotboy"),
                              ),
                            ),

                          ],
                        ),
                      )
                    ]
                )
            )
        ),
      )
  );
}


