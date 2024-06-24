import 'package:app/core/util/logger.dart';

void printResponse(response) {
  if (response is Map) {
    if (response.containsKey('data')) {
      if (response["data"] is Map) {
        var res = response["data"] as Map;
        res.forEach((k, v) => logger.i('key: $k, value: $v'));
      }
      if (response["data"] is List) {
        var res = response["data"] as List;
        for (var e in res) {
          logger.i('遍历list: ${e.toString()}');
        }
      }
    } else {
      logger.i("response中没有data");
    }
  } else {
    logger.i("response不是Map");
  }
}
