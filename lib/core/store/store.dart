import 'package:app/core/store/model/auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class HiveStore {
  final _hiveBoxName = 'hive_box';
  static const keyAuth = 'key:auth';

  Future<void> save(String key, value) async {
    var box = await Hive.openBox(_hiveBoxName);
    await box.put(key, value); //todo ,这里的key需要是子项
    box.close();
  }

  Future get(String key, {defaultValue}) async {
    var box = await Hive.openBox(_hiveBoxName);
    var value = box.get(key, defaultValue: defaultValue);
    box.close();
    return value;
  }

// Add other methods for different data types as needed
}

initializeHive() async {
  // thanks  `亚·坤` for this suggestion
  var dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(AuthAdapter());
}
