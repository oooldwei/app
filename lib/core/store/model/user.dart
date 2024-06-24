import 'package:app/core/store/model/authority.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class UserInfo extends HiveObject {
  @HiveField(0)
  int? ID;
  @HiveField(1)
  DateTime? CreatedAt;
  @HiveField(2)
  DateTime? UpdatedAt;
  @HiveField(3)
  String? uuid;
  @HiveField(4)
  String? userName;
  @HiveField(5)
  String? nickName;
  @HiveField(6)
  String? sideMode;
  @HiveField(7)
  String? headerImg;
  @HiveField(8)
  String? baseColor;
  @HiveField(9)
  int? authorityId;
  @HiveField(10)
  String? phone;
  @HiveField(11)
  String? email;
  @HiveField(12)
  int? enable;
  @HiveField(13)
  Authority? authority;
  @HiveField(14)
  List<Authority>? authorities;

  UserInfo({
    this.ID,
    this.CreatedAt,
    this.UpdatedAt,
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
    this.authority,
    this.authorities,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      ID: json['ID'],
      CreatedAt:
          json['CreatedAt'] != null ? DateTime.parse(json['CreatedAt']) : null,
      UpdatedAt:
          json['UpdatedAt'] != null ? DateTime.parse(json['UpdatedAt']) : null,
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
      authority: json['authority'] != null
          ? Authority.fromJson(json['authority'])
          : null,
      authorities: json['authorities'] != null
          ? (json['authorities'] as List)
              .map((item) => Authority.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "ID": ID,
        "CreatedAt": CreatedAt,
        "UpdatedAt": UpdatedAt,
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
        "authority": authority?.toJson(),
        "authorities": authorities,
      };
}
