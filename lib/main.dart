import 'package:flutter/material.dart';
import 'package:flutter_app/core/component/state.dart';
import 'package:flutter_app/core/theme/color_theme.dart';
import 'package:flutter_app/core/utils/loading.dart';
import 'package:flutter_app/service/binding/main_binding.dart';
import 'package:flutter_app/service/controller/main_controller.dart';
import 'package:flutter_app/service/routes/route_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return Obx(
          () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialBinding: MainBinding(),
            getPages: RouteApp.route,
            theme: lightTheme(context),
            darkTheme: darkTheme(context),
            themeMode: themeMode.value == 'dark' ? ThemeMode.dark : ThemeMode.light,
            home: MainApp(),
          ),
        );
      },
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final main = Get.find<MainController>();

    return Scaffold(
      body: Center(
        child: Obx(
          () => main.isLoading.isTrue ? StateComp().loading(LoadingEnums.circle) : SizedBox(),
        ),
      ),
    );
  }
}
