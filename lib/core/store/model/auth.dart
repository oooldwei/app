import 'package:hive/hive.dart';

part 'auth.g.dart';

@HiveType(typeId: 0)
class Auth extends HiveObject {
  @HiveField(0)
  final String? token;
  @HiveField(1)
  final int? expiresAt;

  Auth({
    this.token,
    this.expiresAt,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      token: json['token'],
      expiresAt: json['expiresAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expiresAt': expiresAt,
    };
  }
}
