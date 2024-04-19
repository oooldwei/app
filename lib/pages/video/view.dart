import 'package:app/pages/video/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPage extends GetView<VideoController> {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("ioooo"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text("获取数据"),
              onPressed: () => controller.getVideInfo(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(controller.state.videoInfo.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
