import 'package:app/api/model/player_playurl.dart';
import 'package:app/api/model/response.dart';
import 'package:app/api/model/web_interface.dart';
import 'package:app/core/http/request.dart';
import 'package:app/core/util/logger.dart';

class BilibiliApi {
  /// 查询bvid信息
  static Future<BiliApiResponse<WebInterfaceView>> getWebInterfaceView({
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
    return BiliApiResponse<WebInterfaceView>.fromJson(
        response, WebInterfaceView.fromJson);
  }

  /// 查询视频信息
  static Future<BiliApiResponse<PlayerPlayUrl>> getPlayerPlayUrl({
    Map<String, dynamic>? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/x/player/playurl',
      queryParameters: params,
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return BiliApiResponse<PlayerPlayUrl>.fromJson(
        response, PlayerPlayUrl.fromJson);
  }
}
