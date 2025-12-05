import 'package:flutter_app/presentation/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
import '../controller/main_controller.dart';
import '../injection/dependency_injection.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DependencyInjection(), permanent: true);
    Get.put(AuthController(), permanent: true);
    Get.put(MainController(), permanent: true);
  }
}
