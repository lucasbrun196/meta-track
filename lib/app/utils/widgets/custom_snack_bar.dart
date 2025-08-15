import 'package:flutter/material.dart';

class CustomSnackBar {
  static success(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text(
          message,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  static error(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
