import 'package:app/view/other/discover/controller.dart';
import 'package:get/get.dart';

class DiscoverBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscoverController>(() => DiscoverController());
  }
}
