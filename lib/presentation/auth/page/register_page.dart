import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:started_project/core/utils/responsif_desain.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20 * scales(context)),
        child: Column(
          children: [
            SizedBox(
              height: 200 * scales(context),
              width: Get.width,
              child: Column(children: [
                
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
