import 'package:app/view/discover/view.dart';
import 'package:app/view/profile/view.dart';
import 'package:app/view/tools/view.dart';
import 'package:flutter/material.dart';

// 导航名称
List<String> bottomNavigationTabTitles = ['discover', 'tools', 'profile'];
// 导航按钮
List<BottomNavigationBarItem> bottomNavigationTabs = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.explore_outlined,
    ),
    activeIcon: Icon(
      Icons.explore,
    ),
    label: '发现',
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.settings_applications_outlined,
    ),
    activeIcon: Icon(
      Icons.settings_applications,
    ),
    label: '工具',
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.account_box_outlined,
    ),
    activeIcon: Icon(
      Icons.account_box,
    ),
    label: '我的',
  ),
];

// 按钮对应的页面
List<Widget> buildPageView() {
  return const <Widget>[
    DiscoverPage(),
    ToolsPage(),
    ProfilePage(),
  ];
}
