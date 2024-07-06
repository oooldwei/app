import 'package:app/core/util/logger.dart';
import 'package:app/view/zhyx/hypermarket/controller.dart';
import 'package:app/view/zhyx/hypermarket/model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HypermarketProductAddPage extends GetView<HypermarketController> {
  const HypermarketProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int? hypermarketId = Get.arguments;
    controller.state.hypermarketId.value = hypermarketId ?? 0;
    // logger.i("页面接收: ${controller.state.hypermarketId.value}");
    return Obx(() => GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('超市商品添加'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.productAddFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 这里的controller不能实时刷新了
                      const SizedBox(height: 16.0),
                      _buildTextFormField(
                        controller: controller.barcodeController,
                        labelText: '商品条码',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '请输入商品条码';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.qr_code_scanner),
                          onPressed: () {
                            // 调用二维码扫描功能
                            controller.scanBarcode();
                          },
                        ),
                      ),
                      const SizedBox(height: 16.0),
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
                      _buildDropdownSearch(
                        labelText: '超市名称',
                        items: controller.state.hypermarketList.value,
                        onChanged: (value) {
                          logger.i("超市ID: ${value?.id}");
                          controller.state.hypermarketId.value = value?.id ?? 0;
                        },
                        defaultItem: controller.state.hypermarketId.value == 0
                            ? null
                            : controller.state.hypermarketList.value.firstWhere(
                                (hypermarket) =>
                                    hypermarket.id ==
                                    controller.state.hypermarketId.value),
                        validator: (value) {
                          if (value == null) {
                            return '请选择超市名称';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      _buildTextFormField(
                        controller: controller.priceController,
                        labelText: '商品价格',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '请输入商品价格';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      controller.state.product.value.image != null &&
                              controller.state.product.value.image != ""
                          ? Center(
                              child: Image.network(
                                controller.state.product.value.image!,
                                width: 180,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Text(
                              "暂无图片 ${controller.state.product.value.image}"),
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
                            child:
                                Text('添加商品', style: TextStyle(fontSize: 16.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }

  Widget _buildDropdownSearch({
    required String labelText,
    required List<Hypermarket> items,
    required void Function(Hypermarket?) onChanged,
    String? Function(Hypermarket?)? validator,
    Hypermarket? defaultItem,
  }) {
    return DropdownSearch<Hypermarket>(
      popupProps: PopupProps.modalBottomSheet(),
      itemAsString: (Hypermarket h) => h.name ?? "",
      items: items,
      selectedItem: defaultItem,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
