import 'package:app/view/zhyx/hypermarket/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HypermarketAddPage extends GetView<HypermarketController> {
  const HypermarketAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("添加超市"), actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
          ),
          onPressed: () {},
        )
      ]),
      body: Text("添加超市form表单"),
    );
  }
}
