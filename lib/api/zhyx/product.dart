import 'package:app/api/model/response.dart';
import 'package:app/core/http/request.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/zhyx/product/model.dart';

class ProductApi {
  static Future<ServerResponse<dynamic>> createProduct({
    dynamic data,
    Map<String, dynamic>? params,
  }) async {
    var response = await HttpUtil().post(
      '/product/createProduct',
      queryParameters: params,
      data: data,
    );
    return ServerResponse<dynamic>.fromJsonWithoutData(response);
  }

  static Future<ServerResponse<DataPage<Product>>> getProductList(
    Map<String, dynamic> params,
  ) async {
    var response = await HttpUtil().get(
      '/product/getProductList',
      queryParameters: params,
    );
    logger.i("坎坎坷坷: ${response.toString()}");
    return ServerResponse<DataPage<Product>>.fromJson(response,
        (data) => DataPage.fromJson(data, (item) => Product.fromJson(item)));
  }
}
