import 'package:app/core/util/logger.dart';
import 'package:app/view/discover/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            snap: true,
            title: Text('超市列表'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text(
                      controller.state.hypermarketList.value[index].name ??
                          'Unknown Name'),
                  onTap: () => logger.i("111111"),
                );
              },
              childCount: controller.state.hypermarketList.value.length,
            ),
          ),
        ],
      ),
    );
  }
}
