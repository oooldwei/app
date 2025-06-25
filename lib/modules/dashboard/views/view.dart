import 'package:app/modules/dashboard/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${controller.state.title}"),
      ),
      body: Text("${controller.state.body}"),
    );
  }
}
