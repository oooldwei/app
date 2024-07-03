import 'package:app/core/store/model/auth.dart';
import 'package:app/core/store/model/authority.dart';
import 'package:app/core/store/model/user.dart';
import 'package:app/core/util/logger.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class HiveStore extends GetxService {
  late Box _box;
  final _hiveBoxName = 'hive_box';
  static const keyAuth = 'key:auth';
  static const keyAuthToken = 'key:auth:token';
  static const keyUserInfo = 'key:user:info';

  Future<HiveStore> init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive
      ..init(dir.path)
      ..registerAdapter(AuthAdapter())
      ..registerAdapter(AuthorityAdapter())
      ..registerAdapter(UserInfoAdapter());
    _box = await Hive.openBox(_hiveBoxName);
    return this;
  }

  Future<void> put(String key, dynamic value) async {
    await _box.put(key, value);
  }

  Future<T> get<T>(String key, T defaultValue) async {
    var value = _box.get(key, defaultValue: defaultValue);
    if (value == null) {
      return defaultValue;
    }
    return value as T;
  }

  Future delete(String key, {defaultValue}) async {
    var value = _box.delete(key);
    return value;
  }

  @override
  void onClose() {
    _box.close();
    super.onClose();
  }
}

Future<void> initHiveServices() async {
  logger.i('starting services ...');
  await Get.putAsync(() => HiveStore().init());
  logger.i('services started ...');
}
