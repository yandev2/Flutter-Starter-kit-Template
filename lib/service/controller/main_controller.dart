import 'package:flutter_app/presentation/auth/controller/auth_controller.dart';
import 'package:flutter_app/service/injection/dependency_injection.dart';
import 'package:flutter_app/service/pref/preferences_service.dart';
import 'package:flutter_app/service/routes/route_name.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final dep = Get.find<DependencyInjection>();
  final auth = Get.find<AuthController>();
  final isLoading = false.obs;
  @override
  void onInit() {
    loadApp();
    super.onInit();
  }

  Future<String?> getToken() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    final data = await PreferencesService().getString('token');
    isLoading.value = false;
    return data;
  }

  Future loadApp() async {
    final authToken = await getToken();
    if (authToken != null) {
      await auth.autoLogin(authToken);
    } else {
      Get.offNamed(RouteName.login);
    }
  }
}
