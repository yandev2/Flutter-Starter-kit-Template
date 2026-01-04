import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../utils/responsif_desain.dart';

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    this.size,
    this.padding,
    this.color,
    this.borderRadius,
    required this.child,
    this.gradient,
  });
  final Size? size;
  final EdgeInsets? padding;
  final Color? color;
  final int? borderRadius;
  final List<Color>? gradient;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size?.height ?? 100 * scales(context),
      width: size?.width ?? 100 * scales(context),
      padding: padding ?? EdgeInsets.all(10 * scales(context)),
      decoration: BoxDecoration(
        color: gradient != null ? null : color ?? Theme.of(context).cardColor,
        gradient: gradient != null
            ? LinearGradient(colors: gradient ?? [transparent, transparent])
            : null,
        borderRadius: BorderRadius.circular(borderRadius?.toDouble() ?? 5 * scales(context)),
        boxShadow: [
          BoxShadow(
            color: gray200!,
            spreadRadius: 2 * scales(context),
            blurRadius: 4 * scales(context),
          ),
        ],
      ),
      child: child,
    );
  }
}
