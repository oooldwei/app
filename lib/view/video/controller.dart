import 'package:app/api/bilibili.dart';
import 'package:app/view/video/state.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  VideoController();

  final state = VideoState();

  getVideInfo() async {
    var conversationRepository = await BilibiliApi.conversationRepository(params: {"bvid": "BV1WC411G7Mg"});
    state.videoInfo.value = conversationRepository.toString();
  }
}