import 'package:app/core/util/logger.dart';
import 'package:app/view/product/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductController();

  final state = ProductState();

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController placeOriginController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController normController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  void submitForm() {
    // 表单提交逻辑
    logger.i("Name: ${nameController.text}");
    logger.i("Place of Origin: ${placeOriginController.text}");
    logger.i("SKU: ${skuController.text}");
    logger.i("Norm: ${normController.text}");
    logger.i("Unit: ${unitController.text}");
  }

  @override
  void onClose() {
    nameController.dispose();
    placeOriginController.dispose();
    skuController.dispose();
    normController.dispose();
    unitController.dispose();
    super.onClose();
  }
}
