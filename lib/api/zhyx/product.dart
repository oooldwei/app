import 'package:app/api/model/response.dart';
import 'package:app/core/http/request.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/zhyx/product/model.dart';

class ProductApi {
  static Future<ServerResponse<Product>> createProduct({
    dynamic data,
    Map<String, dynamic>? params,
  }) async {
    var response = await HttpUtil().post(
      '/product/createProduct',
      queryParameters: params,
      data: data,
    );
    return ServerResponse<Product>.fromJson(response,
        fromJsonT: Product.fromJson);
  }

  static Future<ServerResponse<DataPage<Product>>> getProductList(
    Map<String, dynamic> params,
  ) async {
    var response = await HttpUtil().get(
      '/product/getProductList',
      queryParameters: params,
    );
    return ServerResponse<DataPage<Product>>.fromJson(response,
        fromJsonT: (data) =>
            DataPage.fromJson(data, (item) => Product.fromJson(item)));
  }

  /// 用barcode查询商品
  static Future<ServerResponse<Product>> getProductByBarcode(
    Map<String, dynamic> params,
  ) async {
    var response = await HttpUtil().get(
      '/product/findProductByBarcode',
      queryParameters: params,
    );
    logger.i("坎坎坷坷: ${response.toString()}");
    return ServerResponse<Product>.fromJson(response,
        fromJsonT: Product.fromJson);
  }

  /// 用productId查询商品
  static Future<ServerResponse<Product>> getProductById(
    String productId,
    Map<String, dynamic> params,
  ) async {
    var response = await HttpUtil().get(
      '/product/findProductByProductId/$productId',
      queryParameters: params,
    );
    return ServerResponse<Product>.fromJson(response,
        fromJsonT: Product.fromJson);
  }
}
