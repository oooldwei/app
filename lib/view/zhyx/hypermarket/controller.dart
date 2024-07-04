import 'package:app/api/use/zhyx/hypermarket.dart';
import 'package:app/core/store/store.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/zhyx/hypermarket/state.dart';
import 'package:get/get.dart';

class HypermarketController extends GetxController {
  HypermarketController();

  final state = HypermarketState();

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
  Future<dynamic> getHypermarketProductList(hypermarketId) async {
    Map<String, dynamic> queryParameters = {
      "page": 1,
      "pageSize": 10,
      "hypermarketId": hypermarketId
    };
    var hypermarketProductList =
        await HypermarketApi.getHypermarketProductList(queryParameters);
    logger.i("查询的结果: ${hypermarketProductList}");
    return hypermarketProductList;
  }

  // 初始化
  @override
  void onInit() {
    super.onInit();
    getHypermarketList();
  }
}
