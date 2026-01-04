import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../utils/responsif_desain.dart';

class Forms extends StatelessWidget {
  const Forms({
    super.key,
    required this.controller,
    this.action,
    this.textStyle,
    this.isPassword,
    this.fillColor,
    this.hint,
    this.hintStyle,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixIconColor,
    this.suffixAction,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
  });

  final TextEditingController controller;
  final VoidCallback? action;
  final TextStyle? textStyle;
  final bool? isPassword;
  final Color? fillColor;
  final String? hint;
  final TextStyle? hintStyle;
  final IconData? prefixIcon;
  final int? prefixIconSize;
  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final int? suffixIconSize;
  final Color? suffixIconColor;
  final VoidCallback? suffixAction;
  final int? borderWidth;
  final Color? borderColor;
  final int? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style:
          textStyle ??
          TextTheme.of(
            context,
          ).bodyLarge?.copyWith(fontSize: 13 * scales(context), fontWeight: FontWeight.w500),
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? gray200,
        enabled: true,
        hintText: hint ?? 'hint text',
        hintStyle:
            hintStyle ??
            TextTheme.of(context).bodyMedium?.copyWith(fontSize: 13 * scales(context), color: gray),
        suffixIcon: Icon(
          suffixIcon ?? Icons.remove_red_eye,
          color: suffixIconColor ?? black,
          size: suffixIconSize?.toDouble() ?? 25 * scales(context),
        ),
        prefixIcon: Icon(
          prefixIcon ?? Icons.person,
          color: prefixIconColor ?? black,
          size: prefixIconSize?.toDouble() ?? 25 * scales(context),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: borderWidth?.toDouble() ?? 1, color: lightBlue),
          borderRadius: BorderRadius.circular(borderRadius?.toDouble() ?? 5 * scales(context)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: borderWidth?.toDouble() ?? 1,
            color: borderColor ?? transparent,
          ),
          borderRadius: BorderRadius.circular(borderRadius?.toDouble() ?? 5 * scales(context)),
        ),
      ),
    );
  }
}
