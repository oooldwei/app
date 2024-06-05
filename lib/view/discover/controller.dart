import 'package:app/core/store/store.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/discover/state.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  DiscoverController();

  final state = DiscoverState();
  final HiveStore _hiveStore = HiveStore();

  void add(String context) async {
    await _hiveStore.save(HiveStore.keyAuth, context);
    logger.i("存入的数据: $context");
  }

  void find() async {
    var name = await _hiveStore.get(HiveStore.keyAuth);
    logger.i("查询的结果: $name");
  }
}
