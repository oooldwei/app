import 'package:app/api/use/bilibili.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/video/state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  VideoController();

  final state = VideoState();

  late AudioPlayer _audioPlayer;
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setReleaseMode(ReleaseMode.stop);
    _audioPlayer.onPlayerStateChanged.listen((playState) async {
      logger.i("$playState");
      if (playState == PlayerState.playing) {
        state.isPlaying.value = true;
      } else {
        state.isPlaying.value = false;
      }
      if (playState == PlayerState.completed) {
        await getPlayUrl(
            state.bvid.value,
            state.webInterfaceView.value.pages![state.playingIndex.value + 1]
                .cid);
        String audioUrl = state.playerPlayUrl.value.dash!.audio![0].baseUrl!;
        state.audioUrl.value = audioUrl;
        state.playingIndex.value++;
        play(audioUrl);
      }
    });
  }

  Future<void> play(String audioUrl) async {
    await _audioPlayer.play(UrlSource(audioUrl, mimeType: "audio/mp3"));
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  @override
  void onClose() {
    _audioPlayer.dispose(); // 在关闭控制器时释放资源
    _audioPlayer.stop();
    super.onClose();
  }

  getVideInfo(String bvid) async {
    if (bvid != "") {
      state.bvid.value = bvid;
    }
    // BV1WC411G7Mg
    // BV1VN4y1o7GS
    var webInterfaceView = await BilibiliApi.getWebInterfaceView(
        params: {"bvid": state.bvid.value});
    if (webInterfaceView.code == 0) {
      state.webInterfaceView.value = webInterfaceView.data!;
    } else {
      logger.i(webInterfaceView.message);
    }
  }

  String calculatingTime(int duration) {
    String result = (duration / 60).toStringAsFixed(2);
    var minutes = result.split(".")[0];
    var seconds = result.split(".")[1];
    return '$minutes 分 $seconds 秒';
  }

  getPlayUrl(String bvid, cid) async {
    var playUrl = await BilibiliApi.getPlayerPlayUrl(
        params: {"fnval": "4048", "bvid": bvid, "cid": cid});
    if (playUrl.code == 0) {
      state.playerPlayUrl.value = playUrl.data!;
    }
  }
}
