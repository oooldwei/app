import 'package:app/core/router/observer.dart';
import 'package:app/core/router/routes.dart';
import 'package:app/pages/application/binding.dart';
import 'package:app/pages/application/view.dart';
import 'package:app/pages/tools/binding.dart';
import 'package:app/pages/tools/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static final RouteObserver<Route> observer = AppRouteObserver();
  static List<String> history = [];
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const ApplicationPage(),
      binding: ApplicationBinding(),
    ),
    GetPage(
      name: AppRoutes.tools,
      page: () => const ToolsPage(),
      binding: ToolsBinding(),
    ),
  ];
}
