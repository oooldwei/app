import 'dart:convert';

import 'package:app/view/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 120),
                  const Text(
                    '登录',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  controller.buildInputField(
                    controller: controller.usernameController,
                    hintText: '请输入账号',
                    iconData: Icons.account_box,
                  ),
                  const SizedBox(height: 20),
                  controller.buildInputField(
                    controller: controller.passwordController,
                    hintText: '请输入密码',
                    iconData: Icons.password,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20), // 增加间距
                  Row(
                    children: [
                      Expanded(
                        child: controller.buildInputField(
                          controller: controller.captchaController,
                          hintText: '请输入验证码',
                          iconData: Icons.security,
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        child: controller.state.captchaImageUrl.value != ""
                            ? Image.memory(
                                base64Decode(controller
                                    .state.captchaImageUrl.value
                                    .replaceFirst(
                                        'data:image/png;base64,', '')),
                                height: 48,
                                width: 100,
                              )
                            : const Text('点击获取验证码'),
                        onTap: () => {controller.getCaptchaImageUrl()},
                      ),
                      // Image.network(
                      //   controller.state.captchaImageUrl.value,
                      //   height: 48,
                      //   width: 100,
                      // ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: const Text('忘记密码？'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: controller.login,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text('登录', style: TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: controller.state.isAgreed.value,
                        onChanged: (value) {
                          controller.state.isAgreed.value = value!;
                        },
                      ),
                      const Text('我已阅读并同意'),
                      TextButton(
                        onPressed: () {
                          // Handle user agreement
                        },
                        child: const Text('用户使用协议'),
                      ),
                      const Text('和'),
                      TextButton(
                        onPressed: () {
                          // Handle privacy agreement
                        },
                        child: const Text('隐私协议'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
