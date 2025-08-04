import 'package:flutter/material.dart';

class CustomSnackBar {
  final BuildContext context;
  CustomSnackBar({required this.context});

  successSnackBar(String text) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 8),
          content: Text(text),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(2)),
          showCloseIcon: true,
        ),
      );

  errorSnackBar(String text) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 8),
          content: Text(text),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(2)),
          showCloseIcon: true,
        ),
      );
}
