import 'package:app/view/demo/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoPage extends GetView<DemoController> {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Bar"),
        ),
        body: const Text("Body"),
      ),
    );
  }
}
