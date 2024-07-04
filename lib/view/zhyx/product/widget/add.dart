import 'package:app/view/zhyx/product/controller/product_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddPage extends GetView<ProductAddController> {
  const ProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('商品添加'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextFormField(
                    controller: controller.nameController,
                    labelText: '商品名称',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入商品名称';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  _buildTextFormField(
                    controller: controller.skuController,
                    labelText: 'Sku',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入商品Sku';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  _buildTextFormField(
                    controller: controller.imageController,
                    labelText: '图片URL',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入商品图片URL';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  _buildTextFormField(
                    controller: controller.placeOriginController,
                    labelText: '产地',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入商品产地';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  _buildTextFormField(
                    controller: controller.normController,
                    labelText: '规格',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入商品规格';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  _buildTextFormField(
                    controller: controller.unitController,
                    labelText: '计价单位',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入商品计价单位';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // 调用controller的方法添加产品
                        controller.addProduct();
                        Get.back();
                        // 判断是否为空
                        // if (controller.formKey.currentState!.validate()) {}
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 12.0),
                        child: Text('添加商品', style: TextStyle(fontSize: 16.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: validator,
    );
  }
}
