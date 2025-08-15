import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: const Color.fromARGB(255, 120, 87, 217),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        fontFamily: 'Montserrat',
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Color.fromARGB(255, 120, 87, 217),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
                TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
            backgroundColor: WidgetStateProperty.all(
              Color.fromARGB(255, 120, 87, 217),
            ),
          ),
        ),
      );
}
