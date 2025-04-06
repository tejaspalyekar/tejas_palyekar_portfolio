// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// ThemeData lightThemeData = ThemeData(
//   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//   useMaterial3: true,
//   textTheme: GoogleFonts.poppinsTextTheme(
//     const TextTheme(
//       bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
//       bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
//       bodySmall: TextStyle(fontSize: 12, color: Colors.black),
//       titleLarge: TextStyle(
//           fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
//       titleMedium: TextStyle(
//           fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
//       titleSmall: TextStyle(
//           fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
//       labelLarge: TextStyle(
//           fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
//       labelMedium: TextStyle(
//           fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
//       labelSmall: TextStyle(
//           fontSize: 10, color: Colors.black, fontWeight: FontWeight.w500),
//     ),
//   ),
// );

// ThemeData darkThemeData = ThemeData(
//   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//   scaffoldBackgroundColor: const Color.fromARGB(235, 20, 20, 20),
//   useMaterial3: true,
//   textTheme: GoogleFonts.poppinsTextTheme(
//     const TextTheme(
//       bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
//       bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
//       bodySmall: TextStyle(fontSize: 12, color: Colors.white),
//       titleLarge: TextStyle(
//           fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
//       titleMedium: TextStyle(
//           fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
//       titleSmall: TextStyle(
//           fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
//       labelLarge: TextStyle(
//           fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
//       labelMedium: TextStyle(
//           fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
//       labelSmall: TextStyle(
//           fontSize: 10, color: Colors.white, fontWeight: FontWeight.w500),
//     ),
//   ),
// );
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightThemeData = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.grey,
    onSurface: Colors.black, // Use black for surface text in light mode
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: Colors.black, // Body text should be black in light mode
    displayColor: Colors.black, // Display text (titles) should be black
  ),
  useMaterial3: true,
);

final ThemeData darkThemeData = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.grey,
    onSurface: Colors.white, // Use white for surface text in dark mode
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: Colors.white, // Body text should be white in dark mode
    displayColor: Colors.white, // Display text (titles) should be white
  ),
  useMaterial3: true,
);
