import 'package:app/pages/application/controller.dart';
import 'package:app/pages/discover/controller.dart';
import 'package:app/pages/tools/controller.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<DiscoverController>(() => DiscoverController());
    Get.lazyPut<ToolsController>(() => ToolsController());
  }
}