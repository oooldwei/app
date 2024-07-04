import 'package:app/view/zhyx/product/controller.dart';
import 'package:app/view/zhyx/product/controller/product_add.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<ProductAddController>(() => ProductAddController());
  }
}
