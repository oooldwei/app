import 'package:app/core/router/routes.dart';
import 'package:app/pages/tools/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolsPage extends GetView<ToolsController> {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: const Text("中文"),
          onPressed: () => Get.updateLocale(const Locale('zh', 'CN')),
        ),
        ElevatedButton(
          child: const Text("English"),
          onPressed: () => Get.updateLocale(const Locale('en', 'US')),
        ),
        ElevatedButton(
          child: const Text("Video跳转"),
          onPressed: () => Get.toNamed(AppRoutes.video),
        ),
        Row(
          children: [],
        )
      ],
    );
  }
}
