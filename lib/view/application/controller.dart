import 'package:app/core/router/navigation.dart';
import 'package:app/view/application/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  ApplicationController();

  final state = ApplicationState();

  // tab 页标题
  late final List<String> tabTitles;

  // 页控制器
  late final PageController pageController;

  // tab栏页码切换
  void handlePageChanged(int page) {
    state.page = page;
  }

  // 底部导航项目
  late final List<BottomNavigationBarItem> bottomTabs;

  // tab栏动画
  void handleNavBarTap(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: state.page);
    tabTitles = bottomNavigationTabTitles;
    bottomTabs = bottomNavigationTabs;
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
