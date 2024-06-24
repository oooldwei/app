import 'package:app/api/model/base.dart';
import 'package:app/api/model/response.dart';
import 'package:app/core/http/request.dart';
import 'package:app/core/util/logger.dart';

class BaseApi {
  /// 获取验证码
  static Future<ServerResponse<CaptchaResponseData>> captcha() async {
    var response = await HttpUtil().post(
      '/base/captcha',
    );
    return ServerResponse<CaptchaResponseData>.fromJson(
        response, CaptchaResponseData.fromJson);
  }

  /// 登录接口
  static Future<ServerResponse<LoginResponseData>> login({
    LoginRequestData? data,
    Map<String, dynamic>? params,
  }) async {
    var response = await HttpUtil().post(
      '/base/login',
      queryParameters: params,
      data: data,
    );
    return ServerResponse<LoginResponseData>.fromJson(
        response, LoginResponseData.fromJson);
  }

  /// 退出接口
  static Future<ServerResponse> logout() async {
    var response = await HttpUtil().post(
      '/jwt/jsonInBlacklist',
    );
    logger.i("返回: ${response.toString()}");
    return ServerResponse.fromJsonWithoutData(response);
  }
}
