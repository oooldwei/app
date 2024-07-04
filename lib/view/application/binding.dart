import 'package:app/view/application/controller.dart';
import 'package:app/view/other/tools/controller.dart';
import 'package:app/view/other/video/controller.dart';
import 'package:app/view/system/profile/controller.dart';
import 'package:app/view/zhyx/hypermarket/controller.dart';
import 'package:app/view/zhyx/product/controller.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<HypermarketController>(() => HypermarketController());
    Get.lazyPut<ToolsController>(() => ToolsController());
    Get.lazyPut<VideoController>(() => VideoController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
