
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

myAppBar(String Name, actions){
  return AppBar(
    title: Text(Name),
    iconTheme: IconThemeData(
      color: Colors.white, //change your color here
    ),
    backgroundColor: Color(0xFF1CBFA8),
    actions: actions,
  );
}