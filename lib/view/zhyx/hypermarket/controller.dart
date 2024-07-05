import 'package:app/api/zhyx/hypermarket.dart';
import 'package:app/api/zhyx/product.dart';
import 'package:app/core/store/store.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/zhyx/hypermarket/state.dart';
import 'package:app/view/zhyx/product/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HypermarketController extends GetxController {
  HypermarketController();

  final state = HypermarketState();

  final productAddFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final barcodeController = TextEditingController();
  final skuController = TextEditingController();
  final imageController = TextEditingController();
  final placeOriginController = TextEditingController();
  final normController = TextEditingController();
  final unitController = TextEditingController();

  final HiveStore _hiveStore = Get.find();

  void add(String context) async {
    await _hiveStore.put(HiveStore.keyAuth, context);
    logger.i("存入的数据: $context");
  }

  void find() async {
    var name = await _hiveStore.get(HiveStore.keyAuth, "");
    logger.i("查询的结果: $name");
  }

  // 获取超市列表
  void getHypermarketList() async {
    Map<String, dynamic> queryParameters = {"page": 1, "pageSize": 10};
    var hypermarketList =
        await HypermarketApi.getHypermarketList(queryParameters);
    logger.i("查询的结果: ${hypermarketList.data?.list?.length}");
    logger.i(
        "查询的结果: ${hypermarketList.data?.list?.elementAtOrNull(0)?.toJson()}");
    state.hypermarketList.value = hypermarketList.data!.list!;
  }

  // 获取超市商品列表
  Future<void> getHypermarketProductList(hypermarketId) async {
    logger.i("看看传过来的ID: ${hypermarketId}");
    Map<String, dynamic> params = {
      "page": 1,
      "pageSize": 10,
      "hypermarketId": hypermarketId
    };
    var hypermarketProductList =
        await HypermarketApi.getHypermarketProductList(params);
    // var hypermarketProductList = await ProductApi.getProductList(params);
    // logger.i("查询的结果: ${hypermarketProductList.data!.list![0].toJson()}");
    // state.productList.value = hypermarketProductList.data!.list!;
  }

  void addProduct() async {
    // 提交表单
    final product = Product(
      name: state.product.value.name,
      sku: state.product.value.sku,
      image: state.product.value.image,
      placeOrigin: state.product.value.placeOrigin,
      norm: state.product.value.norm,
      unit: state.product.value.unit,
    );
    // 添加商品逻辑，例如将商品添加到列表或发送到服务器
    var createProduct = await ProductApi.createProduct(data: product);
    logger.i('Product added 结果: ${createProduct.toJson()}');
  }

  void barcodeListener() {
    barcodeController.addListener(() {
      // 更新 text 的值
      state.barcode.value = barcodeController.text;
    });
  }

  // 处理文本变化的方法
  void handleQueryBarcode() async {
    var barcode = state.barcode.value;
    logger.i('输入框内容: $barcode');
    // if (barcode.length != 13 || barcode.length != 14) {
    //   return;
    // }
    // 可以在这里添加其他逻辑处理
    Options requestOptions = Options();
    requestOptions.headers = {
      "Accept": "application/json, text/plain, */*",
      "Host": "bff.gds.org.cn",
      "Origin": "https://www.gds.org.cn",
      "Authorization":
          "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjZFMjRDQ0I0MjRGREEzQ0NCMjk2MkFDMTM3Q0REMEJERTQ2MzVDODZSUzI1NiIsInR5cCI6ImF0K2p3dCIsIng1dCI6ImJpVE10Q1Q5bzh5eWxpckJOODNRdmVSalhJWSJ9.eyJuYmYiOjE3MjAxNTk5OTMsImV4cCI6MTcyMDE2NzE5MywiaXNzIjoiaHR0cHM6Ly9wYXNzcG9ydC5nZHMub3JnLmNuIiwiY2xpZW50X2lkIjoidnVlanNfY29kZV9jbGllbnQiLCJzdWIiOiIyMjI4NzMxIiwiYXV0aF90aW1lIjoxNzIwMTU5OTkyLCJpZHAiOiJsb2NhbCIsInJvbGUiOiJNaW5lIiwiVXNlckluZm8iOiJ7XCJVc2VyTmFtZVwiOm51bGwsXCJCcmFuZE93bmVySWRcIjowLFwiQnJhbmRPd25lck5hbWVcIjpudWxsLFwiR2NwQ29kZVwiOm51bGwsXCJVc2VyQ2FyZE5vXCI6XCLmmoLml6Dkv6Hmga9cIixcIklzUGFpZFwiOmZhbHNlLFwiQ29tcGFueU5hbWVFTlwiOm51bGwsXCJDb21wYW55QWRkcmVzc0NOXCI6bnVsbCxcIkNvbnRhY3RcIjpudWxsLFwiQ29udGFjdFRlbE5vXCI6bnVsbCxcIkdjcExpY2Vuc2VIb2xkZXJUeXBlXCI6bnVsbCxcIkxlZ2FsUmVwcmVzZW50YXRpdmVcIjpudWxsLFwiVW5pZmllZFNvY2lhbENyZWRpdENvZGVcIjpudWxsfSIsIlY0VXNlckluZm8iOiJ7XCJVc2VyTmFtZVwiOlwib2xkd2VpMTg1MThcIixcIkVtYWlsXCI6XCIxNzI5NjU5MDlAcXEuY29tXCIsXCJQaG9uZVwiOlwiMTg2Mjk1NzA1ODZcIixcIkNhcmROb1wiOlwiXCJ9IiwianRpIjoiOTI5QTMyQjFCMjc4MDQxMUQwOTBFMzlGNzI3MzRFMTIiLCJzaWQiOiJDMjM0MTE3MTdCMUEwOUIxQjkwQ0FFMUI2OERDMTU2QSIsImlhdCI6MTcyMDE1OTk5Mywic2NvcGUiOlsib3BlbmlkIiwicHJvZmlsZSIsImFwaTEiLCJvZmZsaW5lX2FjY2VzcyJdLCJhbXIiOlsicHdkIl19.vCb6iZrvbT6rffSFARumVfpjmkAn2bjgaSsogHz9CDCM5W3oUjEsV6Z__jPVzqa-Setm_Wp9eJJwYqZDy8iUpuDH28Wves18R4CA4TqbLToolneTc2GwoUebabPe7Qe6_w-CRy6HVKf5kHrlPn2x4bWVu5LyMflWMSCxL3fYqU8aZcff2wnviVgPTZWJFxHpsWDrYOorAtq91Ah4V0pEQK2wzgSXHU9RwiDiejyzeMzVbOX5IjOaVbZPjJmNKzOcd7zstG9YqKV7-Ncn6nJjSitdfHVXUUZtuBK2BXqCTzIgsoAherdfWAgkXrosPjJ76mvW5EuR6abSDh_ziUENfA",
      "User-Agent":
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36",
    };
    // https://bff.gds.org.cn/gds/searching-api/ProductService/ProductListByGTIN?PageSize=30&PageIndex=1&SearchItem=6925517205837
    // if (barcode.length == 13) {
    barcode = "0$barcode";
    // }
    var response = await Dio().get(
        "https://bff.gds.org.cn/gds/searching-api/ProductService/ProductListByGTIN?PageSize=30&PageIndex=1&SearchItem=06921168593910",
        options: requestOptions);

    logger.i("看看结果: ${response.toString()}");
    var data = response.data["Data"]["Items"][0] as Map<String, dynamic>;
    logger.i("看看结果111111: ${data.toString()}");
    // var result = ServerResponse<Pagination>.fromJson(
    //     response.data as Map<String, dynamic>,
    //     fromJsonT: Pagination.fromJson);
    // logger.i("看看结果: ${result.data.toString()}");
    // logger.i("看看结果: ${result.data!.items![0].pictureFilename}");

    state.product.update((prod) {
      prod?.name = data["description"];
      prod?.placeOrigin = data["firm_name"];
      prod?.sku = data["gtin"];
      prod?.sku = data["gtin"];
      prod?.image = "https://oss.gds.org.cn${data["picture_filename"]}";
    });

    nameController.text = data["description"];
    placeOriginController.text = data["firm_name"];
    skuController.text = data["gtin"];
    imageController.text = "https://oss.gds.org.cn${data["picture_filename"]}";
  }

  // 初始化
  @override
  void onInit() {
    super.onInit();
    getHypermarketList();
    barcodeListener();
  }
}
