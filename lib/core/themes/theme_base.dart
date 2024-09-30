import 'package:flutter/material.dart';

class ThemeBase {
  static ThemeData get themeData {
    return ThemeData(
      // useMaterial3: false,
      primarySwatch: Colors.deepOrange,
      primaryColorLight: Colors.deepOrange.shade300,
      primaryColorDark: Colors.grey.shade800,
      primaryColor: Colors.deepOrange.shade400,
      fontFamily: 'Montserrat',
      // scaffoldBackgroundColor: Colors.grey.shade50,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.orange,
        secondary: Colors.orange,
        tertiary: Colors.green,
        surface: Colors.grey.shade50,
      ),
      textTheme: TextTheme(
        displaySmall: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 10,
        ),
        displayLarge: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        displayMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.orange.shade600,
        ),
        headlineMedium: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: const TextStyle(
          color: Colors.indigo,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 12,
        ),
        bodyLarge: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
        // bodySmall theme used to fix black color
        bodySmall: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // static ThemeData get themeDark {
  //   return ThemeData(
  //     useMaterial3: false,
  //     primarySwatch: Colors.blue,
  //     primaryColorLight: const Color.fromARGB(255, 1, 165, 253),
  //     primaryColorDark: const Color.fromARGB(255, 40, 136, 231),
  //     primaryColor: const Color.fromARGB(255, 9, 82, 192),
  //     fontFamily: 'Montserrat',
  //     scaffoldBackgroundColor: Colors.grey.shade800,
  //     colorScheme: ColorScheme.fromSwatch().copyWith(
  //       brightness: Brightness.dark,
  //       onSurface: Colors.white,
  //       onSurfaceVariant: Colors.white,
  //       primary: Colors.blue,
  //       secondary: Colors.orange,
  //       tertiary: const Color.fromARGB(255, 34, 47, 61),
  //     ),
  //     textTheme: const TextTheme(
  //       displaySmall: TextStyle(
  //         color: Colors.black,
  //         fontSize: 10,
  //       ),
  //       displayLarge: const TextStyle(
  //         fontSize: 26,
  //         fontWeight: FontWeight.bold,
  //         color: Color.fromARGB(255, 40, 190, 255),
  //       ),
  //       headlineMedium: const TextStyle(
  //         color: Colors.white,
  //         fontSize: 13,
  //         fontWeight: FontWeight.w600,
  //       ),
  //       headlineSmall: const TextStyle(
  //         color: Colors.white,
  //         fontSize: 12,
  //         fontWeight: FontWeight.bold,
  //       ),
  //       bodyMedium: const TextStyle(
  //         color: Colors.white,
  //         fontSize: 12,
  //       ),
  //       bodyLarge: const TextStyle(
  //         color: Color.fromARGB(255, 80, 187, 245),
  //         fontSize: 18,
  //       ),
  //       // bodySmall theme used to fix white color
  //       bodySmall: const TextStyle(
  //         fontSize: 13,
  //         fontWeight: FontWeight.bold,
  //         color: Colors.white,
  //       ),
  //     ),
  //   );
  // }
}
