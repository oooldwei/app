import 'package:app/core/store/model/user.dart';

class CaptchaResponseData {
  String? captchaId;
  int? captchaLength;
  bool? openCaptcha;
  String? picPath;

  CaptchaResponseData({
    this.captchaId,
    this.captchaLength,
    this.openCaptcha,
    this.picPath,
  });

  factory CaptchaResponseData.fromJson(Map<String, dynamic> json) {
    return CaptchaResponseData(
      captchaId: json['captchaId'],
      captchaLength: json['captchaLength'],
      openCaptcha: json['openCaptcha'],
      picPath: json['picPath'],
    );
  }

  Map<String, dynamic> toJson() => {
        "captchaId": captchaId,
        "captchaLength": captchaLength,
        "openCaptcha": openCaptcha,
        "picPath": picPath,
      };
}

class LoginRequestData {
  String? captcha;
  String? captchaId;
  String? password;
  String? username;

  LoginRequestData({
    this.captcha,
    this.captchaId,
    this.password,
    this.username,
  });

  factory LoginRequestData.fromJson(Map<String, dynamic> json) {
    return LoginRequestData(
      captcha: json['captcha'],
      captchaId: json['captchaId'],
      password: json['password'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() => {
        "captcha": captcha,
        "captchaId": captchaId,
        "password": password,
        "username": username,
      };
}

class LoginResponseData {
  String? token;
  int? expiresAt;
  UserInfo? user;

  LoginResponseData({
    this.token,
    this.expiresAt,
    this.user,
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) {
    return LoginResponseData(
      token: json['token'],
      expiresAt: json['expiresAt'],
      user: json['user'] != null ? UserInfo.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "expiresAt": expiresAt,
        "user": user?.toJson(),
      };
}
