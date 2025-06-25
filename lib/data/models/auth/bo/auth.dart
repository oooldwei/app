class SmsCaptchaBo {
  String? captcha;
  String? captchaId;
  String? username;

  SmsCaptchaBo({
    this.captcha,
    this.captchaId,
    this.username,
  });

  factory SmsCaptchaBo.fromJson(Map<String, dynamic> json) {
    return SmsCaptchaBo(
      captcha: json['captcha'],
      captchaId: json['captchaId'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() => {
    "captcha": captcha,
    "captchaId": captchaId,
    "username": username,
  };
}

class RegisterOrResetPasswordBo {
  String? username;
  String? password;
  String? confirmPassword;
  String? smsCaptcha;

  RegisterOrResetPasswordBo({
    this.username,
    this.password,
    this.confirmPassword,
    this.smsCaptcha,
  });

  factory RegisterOrResetPasswordBo.fromJson(
      Map<String, dynamic> json) {
    return RegisterOrResetPasswordBo(
      password: json['password'] ?? "",
      username: json['username'] ?? "",
      confirmPassword: json['confirmPassword'] ?? "",
      smsCaptcha: json['smsCaptcha'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "password": password,
    "username": username,
    "confirmPassword": confirmPassword,
    "smsCaptcha": smsCaptcha,
  };
}

class LoginBo {
  String? captcha;
  String? captchaId;
  String? password;
  String? username;
  String? anonymousId;

  LoginBo({
    this.captcha,
    this.captchaId,
    this.password,
    this.username,
    this.anonymousId,
  });

  factory LoginBo.fromJson(Map<String, dynamic> json) {
    return LoginBo(
      captcha: json['captcha'] ?? "",
      captchaId: json['captchaId'] ?? "",
      password: json['password'] ?? "",
      username: json['username'] ?? "",
      anonymousId: json['anonymousId'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "captcha": captcha,
    "captchaId": captchaId,
    "password": password,
    "username": username,
    "anonymousId": anonymousId,
  };
}