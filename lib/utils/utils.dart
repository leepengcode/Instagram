import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        fontSize: 20,
        toastLength: Toast.LENGTH_SHORT);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        reverseAnimationCurve: Curves.easeInOut,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.all(Radius.circular(21)),
        positionOffset: 20,
        icon: Icon(
          Icons.error,
          size: 26,
          color: Colors.white,
        ),
        message: message,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
        animationDuration: Durations.extralong2,
      )..show(context),
    );
  }

  static void flushBarSuccessMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        reverseAnimationCurve: Curves.easeInOut,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.all(Radius.circular(21)),
        positionOffset: 20,
        icon: Icon(
          Icons.done_outline_outlined,
          size: 26,
          color: Colors.white,
        ),
        message: message,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 5),
        animationDuration: Durations.extralong2,
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      duration: Durations.extralong2,
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ));
  }
}
