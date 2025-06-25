class UserInfoVo {
  int? id;
  String? uuid;
  String? userName;
  String? nickName;
  String? sideMode;
  String? headerImg;
  String? baseColor;
  int? authorityId;
  String? phone;
  String? email;
  int? enable;

  UserInfoVo({
    this.id,
    this.uuid,
    this.userName,
    this.nickName,
    this.sideMode,
    this.headerImg,
    this.baseColor,
    this.authorityId,
    this.phone,
    this.email,
    this.enable,
  });

  factory UserInfoVo.fromJson(Map<String, dynamic> json) {
    return UserInfoVo(
      id: json['ID'],
      uuid: json['uuid'],
      userName: json['userName'],
      nickName: json['nickName'],
      sideMode: json['sideMode'],
      headerImg: json['headerImg'],
      baseColor: json['baseColor'],
      authorityId: json['authorityId'],
      phone: json['phone'],
      email: json['email'],
      enable: json['enable'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "userName": userName,
    "nickName": nickName,
    "sideMode": sideMode,
    "headerImg": headerImg,
    "baseColor": baseColor,
    "authorityId": authorityId,
    "phone": phone,
    "email": email,
    "enable": enable,
  };
}