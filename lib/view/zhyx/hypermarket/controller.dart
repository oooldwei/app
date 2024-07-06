import 'package:app/api/zhyx/hypermarket.dart';
import 'package:app/api/zhyx/price.dart';
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
  final priceController = TextEditingController();
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
    logger.i("查询的结果: ${hypermarketProductList.data!.list![0].toJson()}");
    state.productList.value = hypermarketProductList.data!.list!;
  }

  void addProduct() async {
    // 提交表单
    // 添加商品逻辑，例如将商品添加到列表或发送到服务器
    var body = {
      "hypermarketId": state.hypermarketId.value,
      "productId": state.product.value.id,
      "price": int.parse(priceController.text),
    };
    logger.i("打印餐素: ${body.toString()}");
    var createPrice = await PriceApi.createPrice(data: body);
    logger.i("${createPrice.toJson()}");
    state.product.value = Product();
  }

  void scanBarcode() async {
    Get.lazyPut(() => QRScanController());
    String? barcode = await Get.to(() => const QRScanPage());
    if (barcode != null) {
      barcodeController.text = barcode;
    }
  }

  void barcodeListener() {
    barcodeController.addListener(() {
      // 更新 text 的值
      handleQueryBarcode(barcodeController.text);
    });
  }

  // 查询数据库是否存在barcode
  Future<String> queryBarcode(barcode) async {
    var response = await ProductApi.getProductByBarcode({"barcode": barcode});
    if (response.code == 0) {
      var data = response.data;
      state.product.update((prod) {
        prod?.id = data?.id;
        prod?.name = data?.name;
        prod?.barcode = data?.barcode;
        prod?.sn = data?.sn;
        prod?.placeOrigin = data?.placeOrigin;
        prod?.image = data?.image;
      });
      nameController.text = state.product.value.name!;
      placeOriginController.text = state.product.value.placeOrigin!;
      imageController.text = state.product.value.image!;
      logger.i("${state.product.value.image}");
      return "${response.data?.id}";
    } else {
      return "";
    }
  }

  // 处理文本变化的方法
  void handleQueryBarcode(barcode) async {
    if (barcode.length < 13 || barcode.length > 14) {
      return;
    }
    if (barcode.length == 13) {
      barcode = "0$barcode";
    }
    // 通过barcode查询数据库是否存在
    var pid = await queryBarcode(barcode);
    if (pid == "") {
      // 查询并新增商品信息
      // 创建新的Dio实例
      Dio dio = Dio();
      try {
        await dio.get(
            "https://bff.gds.org.cn/gds/searching-api/productservice/gettypeentitythirdcommoninfoasync?productCategoryCode=10000607&typeSource=GPC");
        var response = await dio.get(
            "https://bff.gds.org.cn/gds/searching-api/ProductService/ProductListByGTIN?PageSize=30&PageIndex=1&SearchItem=$barcode");
        logger.i("看看结果: ${response.toString()}");
        var data = response.data["Data"]["Items"][0] as Map<String, dynamic>;
        state.product.update((prod) {
          prod?.name = data["description"];
          prod?.barcode = data["gtin"];
          prod?.sn = data["base_id"];
          prod?.placeOrigin = data["firm_name"];
          prod?.image = data["picture_filename"] != null
              ? "https://oss.gds.org.cn${data["picture_filename"]}"
              : "";
        });
        if (state.product.value.barcode != null &&
            state.product.value.barcode != "") {
          var createResponse =
              await ProductApi.createProduct(data: state.product.value);
          logger.i("新增商品返回: ${createResponse.data?.id}");
          state.product.update((prod) {
            prod?.id = createResponse.data?.id;
          });
          pid = "${createResponse.data?.id}";
        }
        nameController.text = data["description"];
        placeOriginController.text = data["firm_name"];

        // https://www.gds.org.cn/#/barcodeList/index?type=barcode&keyword=6976575154117

        /// TODO 解决反序列化对象失败
        // logger.i("看看结果111111: ${response.data.toString()}");
        // var result = ServerResponse<Pagination>.fromJson(response.data,
        //     fromJsonT: Pagination.fromJson);
        // logger.i("看看结果000000: ${result.data.toString()}");
        // toastInfo(msg: '${result.data!.items![0].description}');
      } finally {
        dio.close(force: true);
        logger.i("关闭连接");
      }
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
