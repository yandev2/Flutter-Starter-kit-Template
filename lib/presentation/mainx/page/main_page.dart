import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:started_project/core/theme/color.dart';
import 'package:started_project/core/utils/assets.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [lightBlue, blue])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [LottieBuilder.asset(AssetsClass.ai)],
        ),
      ),
    );
  }
}
