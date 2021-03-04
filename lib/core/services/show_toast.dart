import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:room_control/core/res/app_resources.dart';

class ShowToast {
  ShowToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.white,
      textColor: AppColors.primary,
    );
  }
}
