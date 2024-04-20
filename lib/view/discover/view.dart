import 'package:app/view/discover/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverPage extends GetView<DiscoverController> {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("discover".tr);
  }
}
