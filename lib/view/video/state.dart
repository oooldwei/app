import 'package:app/api/model/player_playurl.dart';
import 'package:app/api/model/web_interface.dart';
import 'package:get/get.dart';

class VideoState {
  Rx<WebInterfaceView> webInterfaceView = WebInterfaceView().obs;
  Rx<PlayerPlayUrl> playerPlayUrl = PlayerPlayUrl().obs;
  Rx<String> audioUrl = "".obs;
  Rx<String> bvid = "BV1WC411G7Mg".obs;
  Rx<bool> isPlaying = false.obs;
  Rx<int> playingIndex = 0.obs;
}
