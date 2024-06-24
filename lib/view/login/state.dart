import 'package:app/api/model/player_playurl.dart';
import 'package:app/api/model/web_interface.dart';
import 'package:get/get.dart';

class LoginState {
  Rx<String> captchaId = "".obs;
  Rx<String> captchaImageUrl = "".obs;
  Rx<bool> isAgreed = false.obs;
}
