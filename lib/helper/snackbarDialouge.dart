import 'package:flutter/material.dart';


bool colors = false;
bool color = true;

class SnackbarDialogueHelper{
  showSnackbarDialog(BuildContext context, String title, colors) {

    if(colors == true) {
      final snackBar = SnackBar(
      backgroundColor:  colors,
        content: Text(title),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    else {
      {
        final snackBar = SnackBar(
          backgroundColor: colors,
          content: Text(title),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}


