import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomTheme {
  ThemeData themedata = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.red),
        actionsIconTheme: const IconThemeData(color: Colors.amber),
        centerTitle: true,
        elevation: 15,
        titleTextStyle:
            GoogleFonts.roboto(fontSize: 20, color: Colors.lightBlueAccent)),
    scaffoldBackgroundColor: Colors.grey[200],
    textTheme: TextTheme(
      bodySmall: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.2,
          color: const Color(0xff808080)),
      bodyMedium: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.4,
          color: const Color(0xff808080)),
    ),
  );
}
