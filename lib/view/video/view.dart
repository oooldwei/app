import 'package:app/core/util/logger.dart';
import 'package:app/view/video/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPage extends GetView<VideoController> {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("视频页面"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text("刷新数据"),
              onPressed: () => controller.getVideInfo(controller.state.bvid.value),
            ),
            ElevatedButton(
              onPressed:
                  controller.state.isPlaying.value ? controller.pause : null,
              child: Text('暂停'),
            ),
            Expanded(
              child: controller.state.webInterfaceView.value.pages != null
                  ? ListView.builder(
                      itemCount:
                          controller.state.webInterfaceView.value.pages!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: controller.state.playingIndex.value == index ? Text("播放: ${controller.state.webInterfaceView.value
                              .pages![index].part!}") : Text(controller.state.webInterfaceView.value
                              .pages![index].part!),
                          subtitle: Text(
                              "时长: ${controller.calculatingTime(controller.state.webInterfaceView.value.pages![index].duration!)}"),
                          leading: Image.network(controller
                              .state
                              .webInterfaceView
                              .value
                              .pages![index]
                              .firstFrame!),
                          onTap: () async {
                            String aid =
                                "${controller.state.webInterfaceView.value.aid}";
                            String bvid =
                                "${controller.state.webInterfaceView.value.bvid}";
                            String cid =
                                "${controller.state.webInterfaceView.value.pages![index].cid}";
                            // logger.i("打印: \n aid: $aid \n bvid: $bvid \n cid: $cid");
                            await controller.getPlayUrl(bvid, cid);
                            String audioUrl = controller.state.playerPlayUrl
                                .value.dash!.audio![0].baseUrl!;
                            controller.state.audioUrl.value = audioUrl;
                            // logger.i("message: \n ${controller.state.audioUrl.value}");
                            // logger.i("${controller.state.playerPlayUrl
                            //     .value.dash!.audio![1].toJson()}");
                            controller.state.playingIndex.value = index;
                            controller.play(audioUrl);
                          },
                        );
                      },
                    )
                  : Text("啥也没有"),
            ),
          ],
        ),
      ),
    );
  }
}
