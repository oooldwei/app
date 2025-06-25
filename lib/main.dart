import 'dart:io';

import 'package:app/pkg/constants/app.dart';
import 'package:app/pkg/routers/pages.dart';
import 'package:app/pkg/routers/routes.dart';
import 'package:app/pkg/translations/app_translations.dart';
import 'package:app/pkg/utils/sp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux)) {
    // 初始化 window_manager
    await windowManager.ensureInitialized();

    // 设置窗口最小尺寸
    windowManager.setMinimumSize(const Size(350, 500)); // 例如最小宽 800px，高 600px
    windowManager.setSize(const Size(600, 800)); // 例如最小宽 800px，高 600px

    await windowManager.setTitle(AppConfig.appName);

//     WindowOptions windowOptions = WindowOptions(
//       windowButtonVisibility: true,
//       titleBarStyle: TitleBarStyle.hidden,
//       // size: const Size(600, 800),
//       // center: true,
//       skipTaskbar: false,
//       title: "哈哈哈哈哈",
//     );
//     windowManager.waitUntilReadyToShow(windowOptions, () async {
//       await windowManager.show();
//       await windowManager.focus();
//     }); // 例如最大宽 1920px，高 1080px
    // windowManager.setMaximumSize(const Size(1920, 1080)); // 例如最大宽 1920px，高 1080px
  }
  await SPUtils.init(); // 初始化 SharedPreferences
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter App',
      // 去掉右上角的debug
      debugShowCheckedModeBanner: false,
      // 初始化主路由
      initialRoute: AppRoutes.home,
      // 注册路由信息
      getPages: AppPages.routes,
      // 路由导航观察者，监听路由状态
      navigatorObservers: [AppPages.observer],
      // 国际化语言
      translations: AppTranslations(),
      // 优先使用系统语言设置
      locale: PlatformDispatcher.instance.locale,
      // 如果没有对应语言，将会按照此处指定的语言翻译
      fallbackLocale: const Locale('en', 'US'),
      enableLog: true,
      theme: ThemeData(
        splashFactory: NoSplash.splashFactory,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
