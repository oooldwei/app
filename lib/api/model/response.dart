class BiliApiResponse<T> {
  int? code;
  int? ttl;
  T? data;
  String? message;

  BiliApiResponse({
    this.code,
    this.message,
    this.ttl,
    this.data,
  });

  factory BiliApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return BiliApiResponse(
      code: json['code'],
      message: json['message'],
      ttl: json['ttl'],
      data: fromJsonT(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data,
      };
}

class ServerResponse<T> {
  int code;
  T? data;
  String msg;

  ServerResponse(
    this.code,
    this.msg, {
    this.data,
  });

  factory ServerResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ServerResponse(
      json['code'],
      json['msg'],
      data: fromJsonT(json['data']),
    );
  }

  factory ServerResponse.fromJsonWithoutData(Map<String, dynamic> json) {
    return ServerResponse(
      json['code'],
      json['msg'],
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data,
      };
}
