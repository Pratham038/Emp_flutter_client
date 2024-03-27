import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

void errorPopup(BuildContext context, String message) {
  if (!Get.isSnackbarOpen) {
    GetBar(
      message: message,
      duration: const Duration(seconds: 2),
      icon: const Icon(
        Icons.error_outline,
        color: Colors.red,
      ),
      shouldIconPulse: false,
      backgroundColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      forwardAnimationCurve: Curves.bounceIn,
      messageText: Text(
        message,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.0, // Line height equivalent to 16px
          letterSpacing: 0.0,
          color: Colors.red, // Text color set to red
        ),
      ),
    ).show();
  }
}

void successPopup(BuildContext context, String message) {
  if (!Get.isSnackbarOpen) {
    GetBar(
      message: message,
      duration: const Duration(seconds: 2),
      icon: const Icon(
        Icons.check_circle_outline_outlined,
        color: Colors.white,
      ),
      shouldIconPulse: false,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      forwardAnimationCurve: Curves.bounceIn,
      messageText: Text(
        message,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.0, // Line height equivalent to 16px
          letterSpacing: 0.0,
          color: Colors.white, // Text color set to red
        ),
      ),
    ).show();
  }
}
