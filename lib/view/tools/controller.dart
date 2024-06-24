import 'package:app/core/util/logger.dart';
import 'package:app/view/tools/state.dart';
import 'package:get/get.dart';

class ToolsController extends GetxController {
  ToolsController();

  final state = ToolsState();

  test() {
    logger.i("这是个测试");
  }
}
