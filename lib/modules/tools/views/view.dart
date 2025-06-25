import 'package:app/modules/tools/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToolsPage extends GetView<ToolsController> {
  const ToolsPage({super.key});

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
