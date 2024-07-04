import 'package:app/core/router/routes.dart';
import 'package:app/view/zhyx/hypermarket/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HypermarketPage extends GetView<HypermarketController> {
  const HypermarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('超市列表'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // 跳转到新增页面，假设路由名为'/hypermarket/add'
              Get.toNamed(AppRoutes.hypermarketAdd);
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.state.hypermarketList.value.isEmpty
            ? const Center(
                child: Text(
                  '暂无超市数据',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final hypermarket =
                              controller.state.hypermarketList.value[index];
                          return Card(
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: Icon(Icons.store,
                                  color: Theme.of(context).primaryColor),
                              title: Text(
                                hypermarket.name ?? 'Unknown Name',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color: Colors.grey),
                              onTap: () {
                                // 假设路由名为'/hypermarket/detail'，并传递超市ID
                                Get.toNamed(AppRoutes.hypermarketDetail,
                                    arguments: hypermarket.id);
                              },
                            ),
                          );
                        },
                        childCount:
                            controller.state.hypermarketList.value.length,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
