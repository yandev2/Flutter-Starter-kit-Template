import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../utils/responsif_desain.dart';

class PinInputComponent extends StatelessWidget {
  const PinInputComponent({
    super.key,
    this.controller,
    required this.onCompleted,
    this.size,
    this.color,
    this.borderColor,
    this.borderRadius,
  });

  final Size? size;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;
  final TextEditingController? controller;
  final void Function(String pin) onCompleted;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      onCompleted: onCompleted,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      defaultPinTheme: PinTheme(
        height: size?.height ?? 40 * scales(context),
        width: size?.width ?? 40 * scales(context),
        textStyle: TextTheme.of(context).bodyMedium,
        decoration: BoxDecoration(
          border: borderColor == null ? null : Border.all(color: borderColor!, width: 1),
          color: color ?? Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10 * scales(context)),
        ),
      ),
    );
  }
}
