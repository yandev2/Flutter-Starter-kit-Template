import 'package:get/get.dart';
import 'package:started_project/service/controller/dependency_injection_controller.dart';
import '../../../routes/route_name.dart';

class MainController extends GetxController {
  final dep = Get.find<DependencyInjectionController>();

  @override
  void onInit() async {
    //await setup();
    super.onInit();
  }

  Future setup() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(RouteName.register);
  }
}
