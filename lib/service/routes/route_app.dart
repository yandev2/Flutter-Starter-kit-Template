import 'package:flutter_app/presentation/auth/page/auth_page.dart';
import 'package:flutter_app/service/routes/route_name.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteApp {
  static final route = <GetPage>[GetPage(name: RouteName.login, page: () => AuthPage())];
}
