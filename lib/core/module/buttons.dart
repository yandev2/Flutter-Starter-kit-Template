import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/color.dart';
import '../utils/responsif_desain.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.label,
    this.labelStyle,
    this.icon,
    this.iconSize,
    this.iconAlignment,
    this.iconColor,
    this.shadowColor,
    this.elevation,
    this.buttonColor,
    this.buttonSize,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    required this.action,
  });

  final String? label;
  final TextStyle? labelStyle;
  final IconData? icon;
  final int? iconSize;
  final IconAlignment? iconAlignment;
  final Color? iconColor;
  final Color? shadowColor;
  final int? elevation;
  final Color? buttonColor;
  final Size? buttonSize;
  final int? borderWidth;
  final Color? borderColor;
  final int? borderRadius;

  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: action,
      label: Text(
        label ?? 'Button',
        style: labelStyle ?? TextTheme.of(context).bodyLarge?.copyWith(color: white),
      ),
      icon: Icon(icon ?? Icons.people),
      style: ElevatedButton.styleFrom(
        // ignore: prefer_is_empty
        backgroundColor: buttonColor ?? lightBlue,
        fixedSize: buttonSize ?? Size(Get.width, 45 * scales(context)),
        shadowColor: shadowColor ?? shadow,
        elevation: elevation?.toDouble() ?? 2,
        iconSize: iconSize?.toDouble() ?? 20 * scales(context),
        iconAlignment: iconAlignment ?? IconAlignment.start,
        iconColor: iconColor ?? white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: borderWidth?.toDouble() ?? 1, color: borderColor ?? lightBlue),
          borderRadius: BorderRadius.circular(borderRadius?.toDouble() ?? 5 * scales(context)),
        ),
      ),
    );
  }
}
