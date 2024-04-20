import 'package:app/api/model/response.dart';
import 'package:app/api/model/web_interface.dart';
import 'package:app/core/dio/request.dart';

class BilibiliApi {

  /// 查询bvid信息
  static Future<BiliApiResponse<WebInterfaceView>> conversationRepository({
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
    return BiliApiResponse<WebInterfaceView>.fromJson(response, WebInterfaceView.fromJson);
  }
}
