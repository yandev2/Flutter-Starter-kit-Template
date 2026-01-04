import 'dart:math';
import 'package:flutter/material.dart';

double scales(
  BuildContext context, {
  double baseWidth = 375, // iPhone X width
  double maxTextScaleFactor = 2,
}) {
  final width = MediaQuery.of(context).size.width;
  double scale = width / baseWidth;
  return min(scale, maxTextScaleFactor);
}
