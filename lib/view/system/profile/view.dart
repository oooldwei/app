import 'package:app/api/use/base.dart';
import 'package:app/core/router/routes.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/system/profile/controller.dart';
import 'package:app/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    '${controller.state.userInfo.value.headerImg}'),
              ),
              const SizedBox(height: 16),
              Text(
                '${controller.state.userInfo.value.nickName}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),
              const Text(
                '这是我的个性签名。',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  CustomDialog.showConfirmDialog(
                    title: "logout_confirm_dialog_title".tr,
                    content: "logout_confirm_dialog_content".tr,
                    onConfirm: () async {
                      Get.offAndToNamed(AppRoutes.login); // 返回登录页面
                      await BaseApi.logout();
                    },
                    onCancel: () => logger.i("点击了取消按钮"),
                  );
                },
                child: const Text('退出登录'),
              ),
            ],
          ),
        ));
  }
}
