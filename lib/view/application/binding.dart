import 'package:app/view/application/controller.dart';
import 'package:app/view/discover/controller.dart';
import 'package:app/view/tools/controller.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<DiscoverController>(() => DiscoverController());
    Get.lazyPut<ToolsController>(() => ToolsController());
  }
}