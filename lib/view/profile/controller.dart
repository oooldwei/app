import 'package:app/api/use/system/user.dart';
import 'package:app/core/store/model/user.dart';
import 'package:app/core/store/store.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/profile/state.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController();

  final state = ProfileState();
  final HiveStore _hiveStore = Get.find();

  @override
  void onInit() async {
    super.onInit();
    var userInfo =
        await _hiveStore.get<UserInfo>(HiveStore.keyUserInfo, UserInfo());
    state.userInfo.value = userInfo;
    await getUserInfo();
  }

  Future<void> logout() async {
    logger.i("退出登录");
  }

  Future<void> getUserInfo() async {
    var serverResponse = await UserApi.getUserInfo();
    var user = serverResponse.data?.userInfo;
    if (user != null) {
      logger.i("头像: ${user.headerImg}");
      state.userInfo.value = user;
      await _hiveStore.put(HiveStore.keyUserInfo, user);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
