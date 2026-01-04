import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:started_project/core/theme/color.dart';

import '../theme/theme_manager.dart';

enum AlertType { success, warning, danger, info }

class AlertStyle {
  final Color bgLight;
  final Color bgDark;
  final Color iconColor;
  final IconData icon;

  const AlertStyle({
    required this.bgLight,
    required this.bgDark,
    required this.iconColor,
    required this.icon,
  });

  static AlertStyle of(AlertType type) {
    switch (type) {
      case AlertType.success:
        return AlertStyle(
          bgLight: Color(0xFFF1FBF5),
          bgDark: Color(0xFF1E2A23),
          iconColor: green,
          icon: Icons.check_circle,
        );
      case AlertType.warning:
        return AlertStyle(
          bgLight: Color(0xFFFFF7ED),
          bgDark: Color(0xFF2B2415),
          iconColor: amber,
          icon: Icons.warning_rounded,
        );
      case AlertType.danger:
        return AlertStyle(
          bgLight: Color(0xFFFFF1F2),
          bgDark: Color(0xFF2A1E1F),
          iconColor: red,
          icon: Icons.cancel,
        );
      case AlertType.info:
        return AlertStyle(
          bgLight: Color(0xFFF1F5FF),
          bgDark: Color(0xFF1E2433),
          iconColor: blue,
          icon: Icons.info,
        );
    }
  }
}

void showSnackbar({
  required String title,
  required String message,
  AlertType type = AlertType.info,
  String? actionText,
  VoidCallback? onAction,
}) {
  final style = AlertStyle.of(type);

  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.TOP,
    backgroundColor: themeMode.value == 'dark' ? style.bgDark : style.bgLight,
    margin: const EdgeInsets.all(16),
    borderRadius: 12,
    boxShadows: [
      // ignore: deprecated_member_use
      BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 8)),
    ],
    padding: const EdgeInsets.all(16),
    titleText: Row(
      children: [
        Icon(style.icon, color: style.iconColor, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: themeMode.value == 'dark' ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    ),
    messageText: Padding(
      padding: const EdgeInsets.only(left: 28, top: 6),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 13,
          color: themeMode.value == 'dark' ? Colors.white70 : Colors.black87,
          height: 1.4,
        ),
      ),
    ),
    mainButton: actionText != null
        ? TextButton(
            onPressed: () {
              Get.back();
              onAction?.call();
            },
            child: Text(
              actionText,
              style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.w600),
            ),
          )
        : null,
    duration: const Duration(seconds: 4),
  );
}
