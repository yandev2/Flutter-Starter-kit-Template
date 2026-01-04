import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:started_project/routes/route_name.dart';

import 'core/theme/theme_manager.dart';
import 'routes/route_app.dart';
import 'service/binding/main_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return Obx(
          () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeManager().lightTheme(context),
            darkTheme: ThemeManager().darkTheme(context),
            themeMode: themeMode.value == 'dark' ? ThemeMode.dark : ThemeMode.light,
            initialBinding: MainBinding(),
            getPages: RouteApp.route,
            initialRoute: RouteName.main,
          ),
        );
      },
    );
  }
}
