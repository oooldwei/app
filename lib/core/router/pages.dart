import 'package:app/core/router/observer.dart';
import 'package:app/core/router/routes.dart';
import 'package:app/view/application/binding.dart';
import 'package:app/view/application/view.dart';
import 'package:app/view/login/binding.dart';
import 'package:app/view/login/view.dart';
import 'package:app/view/other/discover/binding.dart';
import 'package:app/view/other/discover/view.dart';
import 'package:app/view/other/tools/binding.dart';
import 'package:app/view/other/tools/view.dart';
import 'package:app/view/other/video/binding.dart';
import 'package:app/view/other/video/view.dart';
import 'package:app/view/system/profile/binding.dart';
import 'package:app/view/system/profile/view.dart';
import 'package:app/view/zhyx/hypermarket/binding.dart';
import 'package:app/view/zhyx/hypermarket/view.dart';
import 'package:app/view/zhyx/hypermarket/widget/hypermarket_add.dart';
import 'package:app/view/zhyx/hypermarket/widget/product_add.dart';
import 'package:app/view/zhyx/hypermarket/widget/product_list.dart';
import 'package:app/view/zhyx/product/binding.dart';
import 'package:app/view/zhyx/product/view.dart';
import 'package:app/view/zhyx/product/widget/product_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static final RouteObserver<Route> observer = AppRouteObserver();
  static List<String> history = [];
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.tools,
      page: () => const ToolsPage(),
      binding: ToolsBinding(),
    ),
    GetPage(
      name: AppRoutes.discover,
      page: () => const DiscoverPage(),
      binding: DiscoverBinding(),
    ),
    GetPage(
      name: AppRoutes.video,
      page: () => const VideoPage(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: AppRoutes.product,
      page: () => const ProductPage(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.productAdd,
      page: () => const ProductAddPage(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: AppRoutes.hypermarket,
      page: () => const HypermarketPage(),
      binding: HypermarketBinding(),
    ),
    GetPage(
      name: AppRoutes.hypermarketAdd,
      page: () => const HypermarketAddPage(),
      binding: HypermarketBinding(),
    ),
    GetPage(
      name: AppRoutes.hypermarketProductAdd,
      page: () => const HypermarketProductAddPage(),
      binding: HypermarketBinding(),
    ),
    GetPage(
      name: AppRoutes.hypermarketDetail,
      page: () => const HypermarketProductListPage(),
      binding: HypermarketBinding(),
    ),
  ];
}
