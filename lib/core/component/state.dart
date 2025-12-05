import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/icon.dart';
import 'package:flutter_app/core/utils/responsif.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class StateComp {
  Widget loading(String type, {Color color = Colors.blue, double size = 40}) {
    switch (type.toLowerCase()) {
      case "rotatingplain":
        return SpinKitRotatingPlain(color: color, size: size);

      case "doublebounce":
        return SpinKitDoubleBounce(color: color, size: size);

      case "wave":
        return SpinKitWave(color: color, size: size);

      case "wanderingcubes":
        return SpinKitWanderingCubes(color: color, size: size);

      case "fadingfour":
        return SpinKitFadingFour(color: color, size: size);

      case "fadingcube":
        return SpinKitFadingCube(color: color, size: size);

      case "pulse":
        return SpinKitPulse(color: color, size: size);

      case "chasingdots":
        return SpinKitChasingDots(color: color, size: size);

      case "threebounce":
        return SpinKitThreeBounce(color: color, size: size);

      case "circle":
        return SpinKitCircle(color: color, size: size);

      case "cubegrid":
        return SpinKitCubeGrid(color: color, size: size);

      case "fadingcircle":
        return SpinKitFadingCircle(color: color, size: size);

      case "rotatingcircle":
        return SpinKitRotatingCircle(color: color, size: size);

      case "foldingcube":
        return SpinKitFoldingCube(color: color, size: size);

      case "pumpingheart":
        return SpinKitPumpingHeart(color: color, size: size);

      case "hourglass":
        return SpinKitHourGlass(color: color, size: size);

      case "pouringhourglass":
        return SpinKitPouringHourGlass(color: color, size: size);

      case "pouringhourglassrefined":
        return SpinKitPouringHourGlassRefined(color: color, size: size);

      case "fadinggrid":
        return SpinKitFadingGrid(color: color, size: size);

      case "ring":
        return SpinKitRing(color: color, size: size);

      case "ripple":
        return SpinKitRipple(color: color, size: size);

      case "spinningcircle":
        return SpinKitSpinningCircle(color: color, size: size);

      case "spinninglines":
        return SpinKitSpinningLines(color: color, size: size);

      case "squarecircle":
        return SpinKitSquareCircle(color: color, size: size);

      case "dualring":
        return SpinKitDualRing(color: color, size: size);

      case "pianowave":
        return SpinKitPianoWave(color: color, size: size);

      case "dancingsquare":
        return SpinKitDancingSquare(color: color, size: size);

      case "threeinout":
        return SpinKitThreeInOut(color: color, size: size);

      case "wavespinner":
        return SpinKitWaveSpinner(color: color, size: size);

      case "pulsinggrid":
        return SpinKitPulsingGrid(color: color, size: size);

      default:
        return SpinKitCircle(color: color, size: size);
    }
  }

  Widget error(String? subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Image.asset(IconEnums.error, width: 50 * ScaleSize.imageScale(Get.context as BuildContext)),
        Text(
          subtitle ?? 'terjadi kesalahan yang tidak terduga, silahkan muat ulang halaman ini',
          style: Theme.of(Get.context as BuildContext).textTheme.bodyMedium,
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(Get.context as BuildContext)),
        ),
      ],
    );
  }
}
