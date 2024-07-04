import 'package:app/api/use/zhyx/hypermarket.dart';
import 'package:app/core/store/store.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/discover/state.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  DiscoverController();

  final state = DiscoverState();
  final HiveStore _hiveStore = Get.find();

  void add(String context) async {
    await _hiveStore.put(HiveStore.keyAuth, context);
    logger.i("存入的数据: $context");
  }

  void find() async {
    var name = await _hiveStore.get(HiveStore.keyAuth, "");
    logger.i("查询的结果: $name");
  }

  void getHypermarketList() async {
    Map<String, dynamic> queryParameters = {"page": 1, "pageSize": 10};
    var hypermarketList =
        await HypermarketApi.getHypermarketList(queryParameters);
    logger.i("查询的结果: ${hypermarketList.data?.list?.length}");
    logger.i(
        "查询的结果: ${hypermarketList.data?.list?.elementAtOrNull(0)?.toJson()}");
    // logger.i("查询的结果: ${userList.data?.list?.length}");
    // logger.i("查询的结果: ${userList.data?.list?.elementAtOrNull(0)?.toJson()}");
    // logger.i("查询的结果: ${userList.data?.list?.elementAtOrNull(1)?.toJson()}");
    // logger.i("查询的结果: ${userList.data?.list?.elementAtOrNull(2)?.toJson()}");
  }
}
