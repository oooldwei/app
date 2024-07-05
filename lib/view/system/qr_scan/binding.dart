import 'package:app/view/system/qr_scan/controller.dart';
import 'package:get/get.dart';

class QRScanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QRScanController>(() => QRScanController());
  }
}
