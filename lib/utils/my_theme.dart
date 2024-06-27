import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

final defaultTextTheme = TextTheme(
  headline1: GoogleFonts.cormorant(
    fontSize: 101,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.urbanist(
    fontSize: 63,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: GoogleFonts.urbanist(
    fontSize: 50,
    fontWeight: FontWeight.w400,
  ),
  headline4: GoogleFonts.urbanist(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headline5: GoogleFonts.urbanist(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  ),
  headline6: GoogleFonts.urbanist(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  subtitle1: GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  subtitle2: GoogleFonts.urbanist(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyText1: GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyText2: GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  button: GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  caption: GoogleFonts.urbanist(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  overline: GoogleFonts.urbanist(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);

class MyTheme {
  static final theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    backgroundColor: Colors.white,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: primaryColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      iconTheme: IconThemeData(color: blackColor),
      titleTextStyle: TextStyle(color: blackColor),
      elevation: 0,
    ),
    textTheme: defaultTextTheme.apply(bodyColor: blackColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      fillColor: greyColor,
      filled: true,
      focusColor: blackColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: blackColor,
      selectionColor: blackColor,
      selectionHandleColor: blackColor,
    ),
  );
}
