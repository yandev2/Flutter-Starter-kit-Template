import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/responsif_desain.dart';
import 'color.dart';

RxString themeMode = 'light'.obs;

class ThemeManager {
  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: white,
        shadowColor: transparent,
      ),
      useMaterial3: true,
      hoverColor: lightGreen,
      focusColor: red,
      canvasColor: amber,
      primaryColor: lightBlue,
      cardColor: white,
      shadowColor: shadow,
      dividerColor: gray,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xFFF9F9F9),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.openSans(
          color: black,
          fontSize: 25 * scales(context),
          fontWeight: FontWeight.w800,
        ),

        titleMedium: GoogleFonts.openSans(
          color: black,
          fontSize: 15 * scales(context),
          fontWeight: FontWeight.w500,
        ),
        titleSmall: GoogleFonts.openSans(
          color: black,
          fontSize: 10 * scales(context),
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: GoogleFonts.openSans(color: black, fontSize: 14 * scales(context)),
        bodyMedium: GoogleFonts.openSans(color: gray, fontSize: 12 * scales(context)),
        bodySmall: GoogleFonts.openSans(color: gray, fontSize: 10 * scales(context)),
      ),
    );
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: white,
        shadowColor: transparent,
      ),
      useMaterial3: true,
      hoverColor: green,
      focusColor: red,
      canvasColor: amber,
      shadowColor: shadow,
      dividerColor: gray200,
      cardColor: white,
      primaryColor: lightBlue,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xFFF9F9F9),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.openSans(
          color: white,
          fontSize: 25 * scales(context),
          fontWeight: FontWeight.w800,
        ),

        titleMedium: GoogleFonts.openSans(
          color: white,
          fontSize: 15 * scales(context),
          fontWeight: FontWeight.w500,
        ),
        titleSmall: GoogleFonts.openSans(
          color: white,
          fontSize: 10 * scales(context),
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: GoogleFonts.openSans(color: white, fontSize: 14 * scales(context)),
        bodyMedium: GoogleFonts.openSans(color: gray200, fontSize: 12 * scales(context)),
        bodySmall: GoogleFonts.openSans(color: gray200, fontSize: 10 * scales(context)),
      ),
    );
  }
}
