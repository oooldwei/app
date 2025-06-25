import 'package:app/modules/application/bindings/binding.dart';
import 'package:app/modules/application/views/view.dart';
import 'package:app/modules/dashboard/bindings/binding.dart';
import 'package:app/modules/dashboard/views/view.dart';
import 'package:app/modules/tools/bindings/binding.dart';
import 'package:app/modules/tools/views/view.dart';
import 'package:app/pkg/routers/observer.dart';
import 'package:app/pkg/routers/routes.dart';
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
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.tools,
      page: () => const ToolsPage(),
      binding: ToolsBinding(),
    ),
  ];
}
