import 'package:app/core/store/model/user.dart';
import 'package:get/get.dart';

class ProfileState {
  Rx<UserInfo> userInfo =
      UserInfo(nickName: "名字", headerImg: "https://picsum.photos/300/300").obs;
}
