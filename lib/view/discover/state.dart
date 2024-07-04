import 'package:app/api/model/zhyx/hypermarket.dart';
import 'package:get/get.dart';

class DiscoverState {
  Rx<List<Hypermarket>> hypermarketList =
      Rx<List<Hypermarket>>(List.empty(growable: true));
}
