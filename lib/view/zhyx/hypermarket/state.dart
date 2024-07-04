import 'package:app/view/zhyx/hypermarket/model.dart';
import 'package:get/get.dart';

class HypermarketState {
  Rx<List<Hypermarket>> hypermarketList =
      Rx<List<Hypermarket>>(List.empty(growable: true));

  Rx<String> test = "999".obs;
}
