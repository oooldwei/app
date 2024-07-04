import 'package:app/core/router/routes.dart';
import 'package:app/view/zhyx/hypermarket/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HypermarketDetailPage extends GetView<HypermarketController> {
  const HypermarketDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品"), actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.add,
          ),
          onPressed: () {
            // 跳转到新增页面，假设路由名为'/hypermarket/add'
            Get.toNamed(AppRoutes.productAdd);
          },
        )
      ]),
      body: Text("超市商品列表 ${controller.state.test.value}"),
    );
  }
}
