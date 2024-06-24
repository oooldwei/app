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

class UserListResponseData {
  List<UserInfo>? list;
  int? page;
  int? pageSize;
  int? total;

  UserListResponseData({this.list, this.page, this.pageSize, this.total});

  factory UserListResponseData.fromJson(Map<String, dynamic> json) {
    return UserListResponseData(
      list: json['list'] != null
          ? (json['list'] as List)
              .map((item) => UserInfo.fromJson(item))
              .toList()
          : null,
      page: json['page'],
      pageSize: json['pageSize'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() => {
        "list": list,
        "page": page,
        "pageSize": pageSize,
        "total": total,
      };
}
