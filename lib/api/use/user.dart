import 'package:app/api/model/response.dart';
import 'package:app/api/model/user.dart';
import 'package:app/core/http/request.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/core/util/print_response.dart';
import 'package:dio/dio.dart';

class UserApi {
  /// 查询用户列表
  static Future<ServerResponse<UserListResponseData>> getUserList({
    dynamic data,
    Map<String, dynamic>? params,
  }) async {
    var response = await HttpUtil().post(
      '/user/getUserList',
      queryParameters: params,
      data: data,
    );
    return ServerResponse<UserListResponseData>.fromJson(
        response, UserListResponseData.fromJson);
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
