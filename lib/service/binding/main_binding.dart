import 'package:get/get.dart';

import '../../presentation/mainx/controller/main_controller.dart';
import '../controller/dependency_injection_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DependencyInjectionController(), permanent: true);
    Get.put(MainController(), permanent: true);
  }
}
