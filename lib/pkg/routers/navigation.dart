import 'package:app/modules/dashboard/views/view.dart';
import 'package:app/modules/tools/views/view.dart';
import 'package:flutter/material.dart';

// 导航名称
List<String> bottomNavigationTabTitles = ['discover', 'product'];
// 导航按钮
List<BottomNavigationBarItem> bottomNavigationTabs = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.explore,
    ),
    activeIcon: Icon(
      Icons.explore_outlined,
    ),
    label: 'discover',
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.handyman,
    ),
    activeIcon: Icon(
      Icons.handyman_outlined,
    ),
    label: 'product',
  ),
];

// 按钮对应的页面
List<Widget> buildPageView() {
  return <Widget>[
    DashboardPage(),
    ToolsPage(),
  ];
}
