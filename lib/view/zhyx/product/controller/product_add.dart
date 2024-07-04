import 'package:app/api/zhyx/product.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/zhyx/product/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final skuController = TextEditingController();
  final imageController = TextEditingController();
  final placeOriginController = TextEditingController();
  final normController = TextEditingController();
  final unitController = TextEditingController();

  void addProduct() async {
    // 提交表单
    final product = Product(
      name: nameController.text,
      sku: skuController.text,
      image: imageController.text,
      placeOrigin: placeOriginController.text,
      norm: normController.text,
      unit: unitController.text,
    );
    // 添加商品逻辑，例如将商品添加到列表或发送到服务器
    var createProduct = await ProductApi.createProduct(data: product);
    logger.i('Product added 结果: ${createProduct.toJson()}');
  }

  @override
  void onClose() {
    nameController.dispose();
    skuController.dispose();
    imageController.dispose();
    placeOriginController.dispose();
    normController.dispose();
    unitController.dispose();
    super.onClose();
  }
}
