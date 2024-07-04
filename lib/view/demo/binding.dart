import 'package:app/view/demo/controller.dart';
import 'package:get/get.dart';

class DemoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoController>(() => DemoController());
  }
}
