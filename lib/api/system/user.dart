import 'package:app/api/model/response.dart';
import 'package:app/api/model/system/user.dart';
import 'package:app/core/http/request.dart';
import 'package:app/core/store/model/user.dart';

class UserApi {
  /// 查询用户列表
  static Future<ServerResponse<DataPage<UserInfo>>> getUserList({
    dynamic data,
    Map<String, dynamic>? params,
  }) async {
    var response = await HttpUtil().post(
      '/user/getUserList',
      queryParameters: params,
      data: data,
    );
    return ServerResponse<DataPage<UserInfo>>.fromJson(response,
        (data) => DataPage.fromJson(data, (item) => UserInfo.fromJson(item)));
  }

  /// 查询用户自身信息
  static Future<ServerResponse<UserInfoResponseData>> getUserInfo() async {
    var response = await HttpUtil().get(
      '/user/getUserInfo',
    );
    return ServerResponse<UserInfoResponseData>.fromJson(
        response, UserInfoResponseData.fromJson);
  }
}
