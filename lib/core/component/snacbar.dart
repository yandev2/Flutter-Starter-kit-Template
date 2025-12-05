import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/icon.dart';
import 'package:flutter_app/core/utils/responsif.dart';
import 'package:get/get.dart';

SnackbarController errorSnacbar(String messege) {
  return Get.snackbar(
    '',
    '',
    duration: const Duration(seconds: 3),
    icon: Padding(
      padding: EdgeInsets.all(ScaleSize.scale( Get.context as BuildContext,5)),
      child: Image.asset(
        IconEnums.error,
        width: 20 * ScaleSize.imageScale(Get.context as BuildContext),
      ),
    ),
    titleText: Text(
      "Error",
      textScaler: TextScaler.linear(ScaleSize.textScaleFactor(Get.context as BuildContext)),
      style: Theme.of(Get.context as BuildContext).textTheme.bodyLarge?.copyWith(
        color: Theme.of(Get.context as BuildContext).focusColor,
        height: 1,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Theme.of(Get.context as BuildContext).cardColor,
    messageText: Text(
      messege,
      style: Theme.of(Get.context as BuildContext).textTheme.bodyMedium,
      textScaler: TextScaler.linear(ScaleSize.textScaleFactor(Get.context as BuildContext)),
    ),
  );
}

SnackbarController successSnacbar(String messege) {
  return Get.snackbar(
    '',
    '',
    icon: Padding(
      padding: EdgeInsets.all(ScaleSize.scale(Get.context as BuildContext, 5)),
      child: Image.asset(
        IconEnums.success,
        width: 20 * ScaleSize.imageScale(Get.context as BuildContext,),
      ),
    ),
    titleText: Text(
      "Success",
      textScaler: TextScaler.linear(ScaleSize.textScaleFactor(Get.context as BuildContext)),
      style: Theme.of(Get.context as BuildContext).textTheme.bodyLarge?.copyWith(
        color: Theme.of(Get.context as BuildContext).hoverColor,
        height: 1,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Theme.of(Get.context as BuildContext).cardColor,
    messageText: Text(
      messege,
      style: Theme.of(Get.context as BuildContext).textTheme.bodyMedium,
      textScaler: TextScaler.linear(ScaleSize.textScaleFactor(Get.context as BuildContext)),
    ),
  );
}
