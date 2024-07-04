import 'package:app/view/other/demo/controller.dart';
import 'package:get/get.dart';

class DemoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoController>(() => DemoController());
  }
}
