import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum GWDialogType { defaultType, primary, positive, danger, dense }

class GWDialogStyle {
  final Color bg;
  final Color iconBg;
  final Color iconColor;
  final Color titleColor;
  final Color actionColor;
  final IconData icon;
  final EdgeInsets padding;

  const GWDialogStyle({
    required this.bg,
    required this.iconBg,
    required this.iconColor,
    required this.titleColor,
    required this.actionColor,
    required this.icon,
    required this.padding,
  });

  static GWDialogStyle of(GWDialogType type, bool dark) {
    switch (type) {
      case GWDialogType.primary:
        return GWDialogStyle(
          bg: dark ? const Color(0xFF1E2433) : Colors.white,
          iconBg: const Color(0xFFE0E7FF),
          iconColor: const Color(0xFF3B82F6),
          titleColor: dark ? Colors.white : Colors.black,
          actionColor: const Color(0xFF3B82F6),
          icon: Icons.info,
          padding: const EdgeInsets.all(20),
        );
      case GWDialogType.positive:
        return GWDialogStyle(
          bg: dark ? const Color(0xFF1F2A23) : Colors.white,
          iconBg: const Color(0xFFDCFCE7),
          iconColor: const Color(0xFF22C55E),
          titleColor: dark ? Colors.white : Colors.black,
          actionColor: const Color(0xFF22C55E),
          icon: Icons.check_circle,
          padding: const EdgeInsets.all(20),
        );
      case GWDialogType.danger:
        return GWDialogStyle(
          bg: dark ? const Color(0xFF2A1E1F) : Colors.white,
          iconBg: const Color(0xFFFEE2E2),
          iconColor: const Color(0xFFEF4444),
          titleColor: dark ? Colors.white : Colors.black,
          actionColor: const Color(0xFFEF4444),
          icon: Icons.error,
          padding: const EdgeInsets.all(20),
        );
      case GWDialogType.dense:
        return GWDialogStyle(
          bg: dark ? const Color(0xFF1E293B) : Colors.white,
          iconBg: Colors.grey.shade200,
          iconColor: Colors.grey.shade700,
          titleColor: dark ? Colors.white : Colors.black,
          actionColor: Colors.grey.shade700,
          icon: Icons.info_outline,
          padding: const EdgeInsets.all(16),
        );
      case GWDialogType.defaultType:
        return GWDialogStyle(
          bg: dark ? const Color(0xFF1F2937) : Colors.white,
          iconBg: Colors.grey.shade200,
          iconColor: Colors.grey.shade600,
          titleColor: dark ? Colors.white : Colors.black,
          actionColor: Colors.grey.shade700,
          icon: Icons.info_outline,
          padding: const EdgeInsets.all(20),
        );
    }
  }
}

void showGWDialog({
  required String title,
  required String message,
  GWDialogType type = GWDialogType.defaultType,
  String leftText = 'Back',
  String rightText = 'Okay!',
  VoidCallback? onLeft,
  VoidCallback? onRight,
}) {
  final dark = Get.isDarkMode;
  final style = GWDialogStyle.of(type, dark);

  Get.dialog(
    Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: Get.width * 0.85,
          padding: style.padding,
          decoration: BoxDecoration(
            color: style.bg,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.15),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(color: style.iconBg, shape: BoxShape.circle),
                    child: Icon(style.icon, color: style.iconColor, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: style.titleColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// Message
              Text(
                message,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: dark ? Colors.white70 : Colors.black87,
                ),
              ),

              const SizedBox(height: 24),

              /// Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                      onLeft?.call();
                    },
                    child: Text(leftText, style: TextStyle(color: style.actionColor)),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: style.actionColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Get.back();
                      onRight?.call();
                    },
                    child: Text(rightText),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
