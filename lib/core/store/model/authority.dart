import 'package:hive/hive.dart';

part 'authority.g.dart';

@HiveType(typeId: 2)
class Authority extends HiveObject {
  @HiveField(0)
  DateTime? CreatedAt;
  @HiveField(1)
  DateTime? UpdatedAt;
  @HiveField(2)
  DateTime? DeletedAt;
  @HiveField(3)
  int? authorityId;
  @HiveField(4)
  String? authorityName;
  @HiveField(5)
  int? parentId;
  @HiveField(6)
  String? dataAuthorityId; // null
  @HiveField(7)
  String? children; // null
  @HiveField(8)
  String? menus; // null
  @HiveField(9)
  String? defaultRouter;

  Authority({
    this.CreatedAt,
    this.UpdatedAt,
    this.DeletedAt,
    this.authorityId,
    this.authorityName,
    this.parentId,
    this.dataAuthorityId,
    this.children,
    this.menus,
    this.defaultRouter,
  });

  factory Authority.fromJson(Map<String, dynamic> json) {
    return Authority(
      CreatedAt:
          json['CreatedAt'] != null ? DateTime.parse(json['CreatedAt']) : null,
      UpdatedAt:
          json['UpdatedAt'] != null ? DateTime.parse(json['UpdatedAt']) : null,
      DeletedAt:
          json['DeletedAt'] != null ? DateTime.parse(json['DeletedAt']) : null,
      authorityId: json['authorityId'],
      authorityName: json['authorityName'],
      parentId: json['parentId'],
      dataAuthorityId: json['dataAuthorityId'],
      children: json['children'],
      menus: json['menus'],
      defaultRouter: json['defaultRouter'],
    );
  }

  Map<String, dynamic> toJson() => {
        "CreatedAt": CreatedAt,
        "UpdatedAt": UpdatedAt,
        "DeletedAt": DeletedAt,
        "authorityId": authorityId,
        "authorityName": authorityName,
        "parentId": parentId,
        "dataAuthorityId": dataAuthorityId,
        "children": children,
        "menus": menus,
        "defaultRouter": defaultRouter,
      };
}
