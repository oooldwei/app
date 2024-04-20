import 'package:app/api/request/bilibili.dart';
import 'package:app/view/video/state.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  VideoController();

  final state = VideoState();

  getVideInfo() async {
    // BV1WC411G7Mg
    // BV1VN4y1o7GS
    var conversationRepository = await BilibiliApi.conversationRepository(params: {"bvid": "BV1VN4y1o7GS"});
    state.videoInfo.value = conversationRepository.data!.staff![0].name!;
  }
}