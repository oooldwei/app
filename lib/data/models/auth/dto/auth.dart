import 'package:app/data/models/auth/vo/auth.dart';

class CaptchaDto {
  String? captchaId;
  int? captchaLength;
  bool? openCaptcha;
  String? picPath;

  CaptchaDto({
    this.captchaId,
    this.captchaLength,
    this.openCaptcha,
    this.picPath,
  });

  factory CaptchaDto.fromJson(Map<String, dynamic> json) {
    return CaptchaDto(
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

class LoginDto {
  String? token;
  int? expiresAt;
  UserInfoVo? user;

  LoginDto({
    this.token,
    this.expiresAt,
    this.user,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(
      token: json['token'],
      expiresAt: json['expiresAt'],
      user: json['user'] != null ? UserInfoVo.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "expiresAt": expiresAt,
        "user": user?.toJson(),
      };
}
