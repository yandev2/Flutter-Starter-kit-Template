import 'package:get/instance_manager.dart';
import 'package:started_project/test_widget/widget_test_controller.dart';

class WidgetTestBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WidgetTestController());
  }
}
