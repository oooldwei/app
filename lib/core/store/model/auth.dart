import 'package:hive/hive.dart';

part 'auth.g.dart';

@HiveType(typeId: 1)
class Auth extends HiveObject {
  @HiveField(0)
  final String token;

  Auth({required this.token});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
