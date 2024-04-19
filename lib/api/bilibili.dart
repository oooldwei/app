import 'package:app/core/dio/request.dart';

class BilibiliApi {

  /// 查询bvid信息
  static Future<void> conversationRepository({
    Map<String, dynamic>? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/x/web-interface/view',
      queryParameters: params,
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return response;
  }
}
