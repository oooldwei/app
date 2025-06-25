import 'package:app/modules/application/controllers/controller.dart';
import 'package:app/modules/dashboard/controllers/controller.dart';
import 'package:app/modules/tools/controllers/controller.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => ToolsController());
  }
}
