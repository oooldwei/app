import 'package:app/view/discover/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("discover".tr),
        ElevatedButton(
          child: Text("存入"),
          onPressed: () => controller.add(DateTime.timestamp().toString()),
        ),
        ElevatedButton(
          child: Text("读取"),
          onPressed: controller.find,
        ),
      ],
    );
  }
}
