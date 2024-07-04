import 'package:app/api/base.dart';
import 'package:app/api/model/base.dart';
import 'package:app/core/router/routes.dart';
import 'package:app/core/store/model/auth.dart';
import 'package:app/core/store/store.dart';
import 'package:app/core/util/logger.dart';
import 'package:app/view/login/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  final state = LoginState();
  final HiveStore _hiveStore = Get.find();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final captchaController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getCaptchaImageUrl();
  }

  void getCaptchaImageUrl() async {
    var baseResponse = await BaseApi.captcha();
    state.captchaId.value = baseResponse.data!.captchaId!;
    state.captchaImageUrl.value = baseResponse.data!.picPath!;
  }

  void showAgreementSnackBar() {
    Get.snackbar(
      '提示',
      '请先同意用户使用协议！', // 内容
      snackPosition: SnackPosition.TOP, // 显示位置
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10), // 底部外边距
      mainButton: TextButton(
        onPressed: () {
          state.isAgreed.value = true;
          Get.closeCurrentSnackbar(); // 关闭当前SnackBar
        },
        child: const Text('同意'),
      ),
    );
  }

  void login() async {
    // TODO 这里需要点击限流
    if (!state.isAgreed.value) {
      showAgreementSnackBar();
      return;
    }

    // 去除用户名和密码前后的空格
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty) {
      logger.i("用户名为空");
      return;
    }

    if (password.isEmpty) {
      logger.i("密码为空");
      return;
    }

    var captcha = captchaController.text.trim();
    var baseResponse = await BaseApi.login(
        data: LoginRequestData(
      captcha: captcha,
      captchaId: state.captchaId.value,
      password: password,
      username: username,
    ));
    if (baseResponse.code == 0) {
      if (baseResponse.data?.token != "") {
        var token = baseResponse.data?.token;
        var expiresAt = baseResponse.data?.expiresAt;
        var auth = Auth(token: token, expiresAt: expiresAt);
        var user = baseResponse.data?.user;
        await _hiveStore.put(HiveStore.keyAuthToken, auth);
        await _hiveStore.put(HiveStore.keyUserInfo, user);
        // 跳转到主页
        Get.offAndToNamed(AppRoutes.home);
        // 跳转之后还执行
        return;
      }
    }
    logger.i("有问题");
  }

  void logout() async {
    var serverResponse = await BaseApi.logout();
    logger.i("退出登录: ${serverResponse.toString()}");
  }

  Widget buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData iconData,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(iconData),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
