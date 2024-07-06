import 'package:app/api/model/response.dart';
import 'package:app/core/http/request.dart';

class PriceApi {
  static Future<ServerResponse<dynamic>> createPrice({
    dynamic data,
    Map<String, dynamic>? params,
  }) async {
    var response = await HttpUtil().post(
      '/price/createPrice',
      queryParameters: params,
      data: data,
    );
    return ServerResponse<dynamic>.fromJson(
      response,
    );
  }
}
