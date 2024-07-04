import 'package:app/view/other/video/controller.dart';
import 'package:get/get.dart';

class VideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoController>(() => VideoController());
  }
}
