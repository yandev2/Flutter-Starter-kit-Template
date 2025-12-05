import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/responsif.dart';
import 'package:get/get.dart';

class CardComp extends StatelessWidget {
  const CardComp({
    super.key,
    required this.child,
    this.color,
    this.borderRadius,
    this.margin,
    this.padding,
    this.height,
    this.width,
  });

  final Widget child;
  final Color? color;
  final int? borderRadius;
  final int? margin;
  final int? padding;
  final int? height;
  final int? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.toDouble(),
      width: (width ?? 0 * ScaleSize.imageScale(Get.context as BuildContext)).toDouble(),
      margin: EdgeInsets.all(ScaleSize.scale(Get.context as BuildContext, margin?.toDouble() ?? 10)),
      padding: EdgeInsets.all(ScaleSize.scale(Get.context as BuildContext, padding?.toDouble() ?? 10)),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(
          ScaleSize.scale(Get.context as BuildContext, borderRadius?.toDouble() ?? 10),
        ),
        boxShadow: [
          BoxShadow(color: Theme.of(context).shadowColor, offset: Offset(2, 2), blurRadius: 3),
        ],
      ),
      child: child,
    );
  }
}
