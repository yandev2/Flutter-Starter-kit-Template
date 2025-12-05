import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/color_theme.dart';
import 'package:flutter_app/core/utils/responsif.dart';
import 'package:get/get.dart';

class FormComp extends StatelessWidget {
  const FormComp({
    super.key,
    this.borderColor,
    this.focusBorderColor,
    this.fillColor,
    this.borderWidth,
    this.borderRadius,
    this.maxLines,
    this.obsecure,
    this.type,
    this.readOnly,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.textStyle,
  });

  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? fillColor;
  final int? borderWidth;
  final int? borderRadius;
  final int? maxLines;

  final bool? obsecure;
  final bool? readOnly;
  final String? hint;
  final TextEditingController controller;
  final TextStyle? textStyle;
  final TextInputType? type;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style:
          textStyle ??
          Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: ScaleSize.font(Get.context as BuildContext, 12),
          ),
      readOnly: readOnly ?? false,
      keyboardType: type,
      obscureText: obsecure ?? false,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScaleSize.scale(Get.context as BuildContext, 10),
          vertical: ScaleSize.scale(Get.context as BuildContext, 10),
        ),
        enabled: true,
        filled: true,
        fillColor: fillColor ?? white,
        hintText: hint ?? '',
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        // hintStyle: GoogleFonts.outfit(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            ScaleSize.scale(Get.context as BuildContext, borderRadius?.toDouble() ?? 5),
          ),
          borderSide: BorderSide(
            width: borderWidth?.toDouble() ?? 1,
            color: focusBorderColor ?? Theme.of(context).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            ScaleSize.scale(Get.context as BuildContext, borderRadius?.toDouble() ?? 5),
          ),
          borderSide: BorderSide(
            width: borderWidth?.toDouble() ?? 1,
            color: borderColor ?? transparent,
          ),
        ),
      ),
    );
  }
}
