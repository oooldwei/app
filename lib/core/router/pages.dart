import 'package:app/core/router/observer.dart';
import 'package:app/core/router/routes.dart';
import 'package:app/view/application/binding.dart';
import 'package:app/view/application/view.dart';
import 'package:app/view/discover/binding.dart';
import 'package:app/view/discover/view.dart';
import 'package:app/view/login/binding.dart';
import 'package:app/view/login/view.dart';
import 'package:app/view/product/binding.dart';
import 'package:app/view/product/view.dart';
import 'package:app/view/profile/binding.dart';
import 'package:app/view/profile/view.dart';
import 'package:app/view/tools/binding.dart';
import 'package:app/view/tools/view.dart';
import 'package:app/view/video/binding.dart';
import 'package:app/view/video/view.dart';
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
  ];
}
