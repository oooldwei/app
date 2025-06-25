import 'package:app/pkg/utils/logger.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BannerContent(),
          TitleContent(title: '群防群治'),
          MenuContent(items: [
            MenuItem(
                title: '任务中心', icon: 'https://picsum.photos/300/300', type: 1),
            MenuItem(
                title: '反馈上报', icon: 'https://picsum.photos/300/300', type: 2),
            MenuItem(
                title: '指令下发', icon: 'https://picsum.photos/300/300', type: 1),
            MenuItem(
                title: '可视调度', icon: 'https://picsum.photos/300/300', type: 3),
          ]),
          TitleContent(title: '勤务工作'),
          MenuContent(items: [
            MenuItem(
                title: '一键打卡', icon: 'https://picsum.photos/300/300', type: 3),
            MenuItem(
                title: '工作台账', icon: 'https://picsum.photos/300/300', type: 4),
            MenuItem(
                title: '警情分析', icon: 'https://picsum.photos/300/300', type: 4),
            MenuItem(
                title: '矛盾纠纷', icon: 'https://picsum.photos/300/300', type: 5),
            MenuItem(
                title: '重点人员', icon: 'https://picsum.photos/300/300', type: 1),
            MenuItem(
                title: '重点场所', icon: 'https://picsum.photos/300/300', type: 5),
            MenuItem(
                title: '量化考核', icon: 'https://picsum.photos/300/300', type: 5),
            MenuItem(
                title: '智能预警', icon: 'https://picsum.photos/300/300', type: 4),
          ]),
          SizedBox(height: 50), // Empty footer equivalent
        ],
      ),
    );
  }
}

class BannerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 268,
      child: Image.network(
        'https://picsum.photos/300/300',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}

class TitleContent extends StatelessWidget {
  final String title;

  TitleContent({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Color(0xFF999999),
        ),
      ),
    );
  }
}

class MenuContent extends StatelessWidget {
  final List<MenuItem> items;

  MenuContent({required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: items.map((item) => item.build(context)).toList(),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final String icon;
  final int type;

  MenuItem({required this.title, required this.icon, required this.type});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => logger.i('点击了$title'),
      child: Container(
        width: (MediaQuery.of(context).size.width - 60) / 2,
        height: 72,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: _getBackgroundColor(type),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF182440),
              ),
            ),
            Image.network(
              icon,
              height: 33,
              width: 31,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(int type) {
    switch (type) {
      case 1:
        return Color(0xFFF5F8FF);
      case 2:
        return Color(0xFFFFFBF5);
      case 3:
        return Color(0xFFF7FEF9);
      case 4:
        return Color(0xFFFFF6F7);
      case 5:
        return Color(0xFFF0F9FF);
      default:
        return Colors.white;
    }
  }
}
