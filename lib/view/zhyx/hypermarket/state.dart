import 'package:app/view/zhyx/hypermarket/model.dart';
import 'package:app/view/zhyx/product/model.dart';
import 'package:get/get.dart';

class HypermarketState {
  Rx<List<Hypermarket>> hypermarketList =
      Rx<List<Hypermarket>>(List.empty(growable: true));
  Rx<List<Product>> productList = Rx<List<Product>>(List.empty(growable: true));
  Rx<int> hypermarketId = 0.obs;
  Rx<Product> product = Rx<Product>(Product());
}
