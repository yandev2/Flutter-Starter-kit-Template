import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../utils/responsif_desain.dart';

class Switchs extends StatelessWidget {
  const Switchs({
    super.key,
    required this.isOn,
    required this.action,
    this.size,
    this.colorOn,
    this.colorOff,
    this.borderRadius,
    this.borderColor,
    this.shadow,
    this.bgColor,
  });
  final bool isOn;
  final VoidCallback action;
  final Size? size;
  final Color? colorOn;
  final Color? colorOff;
  final int? borderRadius;
  final Color? borderColor;
  final Color? shadow;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: size?.width ?? 70 * scales(context),
        height: size?.height ?? 36 * scales(context),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isOn == true ? colorOn ?? lightBlue : colorOff ?? gray200,
          border: Border.all(color: borderColor ?? transparent),
          borderRadius: BorderRadius.circular(borderRadius?.toDouble() ?? 30 * scales(context)),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          alignment: isOn == true ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: bgColor ?? Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))],
            ),
          ),
        ),
      ),
    );
  }
}
