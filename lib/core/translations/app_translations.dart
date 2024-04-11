import 'package:app/core/translations/en_US.dart';
import 'package:app/core/translations/zh_CN.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zhCN,
        'en_US': enUS,
      };
}
