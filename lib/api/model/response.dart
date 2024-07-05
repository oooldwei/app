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

/// 通用接口返回格式
class ServerResponse<T> {
  int code;
  T? data;
  String msg;

  ServerResponse(
    this.code,
    this.msg, {
    this.data,
  });

  factory ServerResponse.fromJson(Map<String, dynamic> json,
      {T Function(Map<String, dynamic>)? fromJsonT}) {
    return ServerResponse(
      json['code'] ?? json['Code'],
      json['msg'] ?? json['Msg'],
      data: fromJsonT != null ? fromJsonT(json['data'] ?? json['Data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data,
      };
}

/// 通用分页数据
class DataPage<T> {
  List<T>? list;
  int page;
  int pageSize;
  int total;

  DataPage(
    this.page,
    this.pageSize,
    this.total, {
    this.list,
  });

  factory DataPage.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return DataPage(
      json['page'],
      json['pageSize'],
      json['total'],
      list: json['list'] != null
          ? (json['list'] as List).map((item) => fromJsonT(item)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "total": total,
        "list": list,
      };
}
