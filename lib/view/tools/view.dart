import 'package:app/core/router/routes.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/tools/controller.dart';
import 'package:app/view/video/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolsPage extends GetView<ToolsController> {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    VideoController videoController = Get.find<VideoController>();
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
        TextField(
          controller: videoController.textController,
          decoration: const InputDecoration(
            labelText: '输入BVID',
          ),
          onChanged: (text) {
            logger.i("Input text: $text");
          },
        ),
        ElevatedButton(
          child: const Text("Video跳转"),
          onPressed: () async {
            Get.toNamed(AppRoutes.video);
            await videoController.getVideInfo(videoController.textController.text);
          },
        ),
        Row(
          children: [],
        )
      ],
    );
  }
}
