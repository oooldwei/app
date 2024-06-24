import 'package:flutter/material.dart';

const _defaultColor = Color(0xFF34568B);

class WhatPage extends StatelessWidget {
  const WhatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network("https://picsum.photos/400/300",
                  fit: BoxFit.cover),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text("群防群治"),
                Container(
                  height: 300,
                  child: GridView.count(
                    //GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，
                    // 我们通过它可以快速的创建横轴固定数量子元素的GridView
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0), // 设置圆角的半径
                        child: ListTile(
                          leading: Text(
                            "任务中心",
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          trailing: Icon(Icons.home),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0), // 设置圆角的半径
                        child: ListTile(
                          leading: Text(
                            "反馈上报",
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          trailing: Icon(Icons.settings),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0), // 设置圆角的半径
                        child: ListTile(
                          leading: Text(
                            "指令下发",
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          trailing: Icon(Icons.search),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0), // 设置圆角的半径
                        child: ListTile(
                          leading: Text(
                            "可视调度",
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          trailing: Icon(Icons.ac_unit),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.deepOrange,
                  height: 150,
                ),
                Container(
                  color: Colors.green,
                  height: 150,
                ),
                Container(
                  color: Colors.lime,
                  height: 150,
                ),
                Container(
                  color: Colors.tealAccent,
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: backgroundColor ?? _defaultColor,
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
