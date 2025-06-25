import 'package:app/modules/application/controllers/controller.dart';
import 'package:app/pkg/routers/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  // 顶部导航
  AppBar _buildAppBar() {
    return AppBar(
        title: Obx(() => Text(
              controller.tabTitles[controller.state.page].tr,
            )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          )
        ]);
  }

  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
      children: buildPageView(),
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.state.page,
        type: BottomNavigationBarType.fixed,
        onTap: controller.handleNavBarTap,
        selectedFontSize: 12,
        // 保持一致字体大小
        unselectedFontSize: 12,
        selectedItemColor: Colors.blue,
        // 自定义颜色
        unselectedItemColor: Colors.grey,
        elevation: 8,
        // 可选：添加阴影
        backgroundColor: Colors.white, // 可选：背景色
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
