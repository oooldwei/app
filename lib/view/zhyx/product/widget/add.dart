import 'package:app/view/zhyx/product/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddPage extends GetView<ProductController> {
  const ProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品添加")),
      body: Text("添加商品的form表单"),
    );
  }
}
