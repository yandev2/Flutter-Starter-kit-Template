import 'package:flutter/material.dart';
import 'package:flutter_app/core/component/button.dart';
import 'package:flutter_app/core/component/form.dart';
import 'package:flutter_app/core/theme/color_theme.dart';
import 'package:flutter_app/core/utils/icon.dart';
import 'package:flutter_app/core/utils/responsif.dart';
import 'package:flutter_app/presentation/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Title",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: primary,
                fontSize: ScaleSize.font(context, 30),
              ),
              textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            ),
            Text(
              "subtitle",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(letterSpacing: 2),
              textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            ),
            SizedBox(height: 30),
            form(context),
          ],
        ),
      ),
    );
  }

  Container form(BuildContext context) {
    final state = Get.find<AuthController>();
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: ScaleSize.scale(context, 50)),
      child: Column(
        children: [
          FormComp(
            controller: state.email.value,
            fillColor: shadow,
            hint: 'Email',
            prefixIcon: Icon(Icons.email),
          ),
          SizedBox(height: 10),
          FormComp(
            controller: state.password.value,
            fillColor: shadow,
            hint: 'Password',
            prefixIcon: Icon(Icons.password, color: Theme.of(context).primaryColor),
          ),
          SizedBox(height: 10),
          Obx(
            () => ButtonComp(
              action: () => state.isLoading.isFalse
                  ? state.login(state.email.value.text, state.password.value.text)
                  : null,
              text: state.isLoading.isTrue ? ' Loading' : ' Login',
              textStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: white, fontWeight: FontWeight.w500),
              icon: Image.asset(
                color: Theme.of(context).cardColor,
                IconEnums.login,
                width: 15 * ScaleSize.imageScale(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
