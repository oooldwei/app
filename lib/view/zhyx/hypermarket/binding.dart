import 'package:app/view/zhyx/hypermarket/controller.dart';
import 'package:get/get.dart';

class HypermarketBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HypermarketController>(() => HypermarketController());
  }
}
