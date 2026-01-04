import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:started_project/routes/route_name.dart';

import '../presentation/auth/page/login_page.dart';
import '../presentation/auth/page/register_page.dart';
import '../presentation/mainx/page/main_page.dart';
import '../service/binding/login_binding.dart';
import '../service/binding/register_binding.dart';
import '../test_widget/widget_test.dart';
import '../test_widget/widget_test_binding.dart';

class RouteApp {
  static final route = [
    GetPage(name: RouteName.test, page: () => WidgetTest(), binding: WidgetTestBinding()),
    GetPage(name: RouteName.main, page: () => MainPage()),
    GetPage(name: RouteName.login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: RouteName.register, page: () => RegisterPage(), binding: RegisterBinding()),
  ];
}
