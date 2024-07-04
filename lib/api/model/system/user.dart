import 'package:app/core/store/model/user.dart';

class UserInfoResponseData {
  UserInfo? userInfo;

  UserInfoResponseData({this.userInfo});

  factory UserInfoResponseData.fromJson(Map<String, dynamic> json) {
    return UserInfoResponseData(
      userInfo:
          json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "userInfo": userInfo?.toJson(),
      };
}
