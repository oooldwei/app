import 'package:app/core/router/pages.dart';
import 'package:app/core/router/routes.dart';
import 'package:app/core/store/store.dart';
import 'package:app/core/translations/app_translations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeHive();
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
      initialRoute: AppRoutes.initial,
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
