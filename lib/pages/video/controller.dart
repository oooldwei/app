import 'package:app/api/bilibili.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/pages/video/state.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  VideoController();

  final state = VideoState();

  @override
  void onInit() {
    super.onInit();
    logger.i("测试接口请求");
    var conversationRepository = BilibiliApi.conversationRepository(params: {"avid": "BV1WC411G7Mg"});
    logger.i(conversationRepository);
  }
}