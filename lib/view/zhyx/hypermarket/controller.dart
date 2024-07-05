import 'package:app/api/zhyx/hypermarket.dart';
import 'package:app/api/zhyx/product.dart';
import 'package:app/core/store/store.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/system/qr_scan/controller.dart';
import 'package:app/view/system/qr_scan/view.dart';
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
      barcode: state.product.value.barcode,
      sn: state.product.value.sn,
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
    state.barcode.value = "";
    state.product.value = Product();
  }

  void scanBarcode() async {
    Get.lazyPut(() => QRScanController());
    String? barcode = await Get.to(() => const QRScanPage());
    logger.i("这也可以吗???????? $barcode");
    if (barcode != null) {
      barcodeController.text = barcode;
    }
  }

  void barcodeListener() {
    barcodeController.addListener(() {
      // 更新 text 的值
      state.barcode.value = barcodeController.text;
      handleQueryBarcode();
    });
  }

  // 处理文本变化的方法
  void handleQueryBarcode() async {
    var barcode = state.barcode.value;
    if (barcode.length < 13 || barcode.length > 14) {
      return;
    }
    logger.i("看看barcode: $barcode");
    // 可以在这里添加其他逻辑处理
    if (barcode.length == 13 || barcode.length > 14) {
      barcode = "0$barcode";
    }
    // 创建新的Dio实例
    Dio dio = Dio();
    try {
      await dio.get(
          "https://bff.gds.org.cn/gds/searching-api/productservice/gettypeentitythirdcommoninfoasync?productCategoryCode=10000607&typeSource=GPC");
      var response = await dio.get(
          "https://bff.gds.org.cn/gds/searching-api/ProductService/ProductListByGTIN?PageSize=30&PageIndex=1&SearchItem=$barcode");
      logger.i("看看结果: ${response.toString()}");
      var data = response.data["Data"]["Items"][0] as Map<String, dynamic>;
      // logger.i("看看结果111111: ${data.toString()}");
      // var result = ServerResponse<Pagination>.fromJson(
      //     response.data as Map<String, dynamic>,
      //     fromJsonT: Pagination.fromJson);
      // logger.i("看看结果: ${result.data.toString()}");
      // logger.i("看看结果: ${result.data!.items![0].pictureFilename}");

      state.product.update((prod) {
        prod?.name = data["description"];
        prod?.barcode = data["gtin"];
        prod?.sn = data["base_id"];
        prod?.placeOrigin = data["firm_name"];
        prod?.sku = data["gtin"];
        prod?.image = data["picture_filename"] != null
            ? "https://oss.gds.org.cn${data["picture_filename"]}"
            : "";
      });

      nameController.text = data["description"];
      placeOriginController.text = data["firm_name"];
      skuController.text = data["gtin"];
      imageController.text =
          "https://oss.gds.org.cn${data["picture_filename"]}";
    } finally {
      dio.close(force: true);
      logger.i("关闭连接");
    }
  }

  // 初始化
  @override
  void onInit() {
    super.onInit();
    getHypermarketList();
    barcodeListener();
  }
}
