import 'package:app/modules/tools/controllers/controller.dart';
import 'package:get/get.dart';

class ToolsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToolsController>(() => ToolsController());
  }
}
