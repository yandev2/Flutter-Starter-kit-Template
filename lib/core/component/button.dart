import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/responsif.dart';
import 'package:get/get.dart';

class ButtonComp extends StatelessWidget {
  const ButtonComp({
    super.key,
    this.icon,
    this.text,
    this.textStyle,
    this.elevation,
    this.shadowColor,
    this.backgroundColor,
    this.size,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    required this.action,
  });

  final Widget? icon;
  final String? text;
  final TextStyle? textStyle;
  final int? elevation;
  final Color? shadowColor;
  final Color? backgroundColor;
  final Size? size;
  final int? borderRadius;
  final Color? borderColor;
  final int? borderWidth;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        elevation: elevation?.toDouble() ?? 2,
        shadowColor: shadowColor ?? Theme.of(context).shadowColor,
        // ignore: deprecated_member_use
        overlayColor: Theme.of(context).cardColor.withOpacity(0.5),
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        fixedSize: size ?? Size(Get.width, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ScaleSize.scale(Get.context as BuildContext, borderRadius?.toDouble() ?? 5),
          ),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: ScaleSize.scale(Get.context as BuildContext, borderRadius?.toDouble() ?? 5),
          ),
        ),
      ),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? const SizedBox(),
          Text(
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(Get.context as BuildContext)),
            '$text',
            style: textStyle ?? Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
