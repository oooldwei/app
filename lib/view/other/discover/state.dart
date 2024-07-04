import 'package:app/view/zhyx/hypermarket/model.dart';
import 'package:get/get.dart';

class DiscoverState {
  Rx<List<Hypermarket>> hypermarketList =
      Rx<List<Hypermarket>>(List.empty(growable: true));
}
