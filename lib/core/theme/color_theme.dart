import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/core/utils/responsif.dart';
import 'package:get/get.dart';

//============> base color app <============\\
final white = Colors.white;
final black = Colors.black;
final dark = const Color.fromARGB(255, 26, 26, 26);
final transparent = Colors.transparent;
final shadow = Colors.grey[200];

final title = Color(0xFF1C1C1E);
final subtitle = Color(0xFF8E8E93);

final primary = const Color(0xFF007AFF);
final warning = const Color.fromARGB(255, 204, 169, 63);
final danger = const Color.fromARGB(255, 255, 63, 49);
final success = const Color.fromARGB(255, 60, 189, 64);

//============> theme app <============\\
RxString themeMode = 'light'.obs;

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
    hoverColor: success,
    focusColor: danger,
    canvasColor: warning,
    brightness: Brightness.light,
    cardColor: white,
    primaryColor: primary,
    scaffoldBackgroundColor: white,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: black,
        fontSize: ScaleSize.font(context, 18),
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: TextStyle(
        color: black,
        fontSize: ScaleSize.font(context, 14),
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(color: subtitle, fontSize: ScaleSize.font(context, 12)),
      bodySmall: TextStyle(color: subtitle, fontSize: ScaleSize.font(context, 10)),
    ),
    shadowColor: shadow,
    dividerColor: subtitle,
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: black,
      shadowColor: transparent,
    ),
    useMaterial3: true,
    hoverColor: success,
    focusColor: danger,
    canvasColor: warning,
    brightness: Brightness.dark,
    cardColor: dark,
    primaryColor: primary,
    scaffoldBackgroundColor: black,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: white,
        fontSize: ScaleSize.font(context, 18),
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: TextStyle(
        color: white,
        fontSize: ScaleSize.font(context, 14),
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(color: subtitle, fontSize: ScaleSize.font(context, 12)),
      bodySmall: TextStyle(color: subtitle, fontSize: ScaleSize.font(context, 10)),
    ),
    shadowColor: shadow,
    dividerColor: subtitle,
  );
}
