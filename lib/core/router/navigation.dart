import 'package:flutter/material.dart';

List<String> bottomNavigationTabTitles = ['discover', 'tools'];
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
];