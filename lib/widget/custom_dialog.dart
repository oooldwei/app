import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static void showConfirmDialog({
    required String title,
    required String content,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back(); // 关闭对话框
              onCancel(); // 执行取消操作
            },
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Get.back(); // 关闭对话框
              onConfirm(); // 执行确认操作
            },
            child: const Text('确认'),
          ),
        ],
      ),
    );
  }
}
