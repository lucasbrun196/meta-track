import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: const Color.fromARGB(255, 120, 87, 217),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        fontFamily: 'Montserrat',
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: const Color.fromARGB(255, 120, 87, 217),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              const Color.fromARGB(130, 120, 87, 217),
            ),
          ),
        ),
      );
}
