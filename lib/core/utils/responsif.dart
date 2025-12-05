import 'dart:math';
import 'package:flutter/material.dart';

class ScaleSize {
  static double textScaleFactor(
    BuildContext context, {
    double baseWidth = 375, // iPhone X width
    double maxTextScaleFactor = 2,
  }) {
    final width = MediaQuery.of(context).size.width;
    double scale = width / baseWidth;
    return min(scale, maxTextScaleFactor);
  }

  static double iconScale(BuildContext context, {double baseWidth = 375}) {
    final width = MediaQuery.of(context).size.width;
    return width / baseWidth;
  }

  // Icon(
  // Icons.home,
  // size: 24 * ScaleSize.iconScale(context),
  // );

  static double imageScale(BuildContext context, {double baseWidth = 375}) {
    final width = MediaQuery.of(context).size.width;
    return width / baseWidth;
  }

  // Image.asset(
  // 'assets/banner.png',
  // width: 200 * ScaleSize.imageScale(context),
  // )

  static double scale(BuildContext context, double size, {double baseWidth = 375}) {
    final width = MediaQuery.of(context).size.width;
    return size * (width / baseWidth);
  }

  // Container(
  // padding: EdgeInsets.all(ScaleSize.scale(context, 12)),
  // decoration: BoxDecoration(
  // borderRadius: BorderRadius.circular(ScaleSize.scale(context, 20)),
  // ),
  // )

  static double font(
    BuildContext context,
    double fontSize, {
    double baseWidth = 375,
    double maxFactor = 2,
  }) {
    final width = MediaQuery.of(context).size.width;
    double factor = min(width / baseWidth, maxFactor);
    return fontSize * factor;
  }

  // Text(
  // "Halo Bos!",
  // style: TextStyle(
  // fontSize: ScaleSize.font(context, 16),
  // ),
  // textScaleFactor: ScaleSize.textScaleFactor(context),
  // )
}
