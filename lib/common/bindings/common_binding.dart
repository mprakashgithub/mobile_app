import 'package:get/get.dart';

import '../controller/common_controller.dart';

class CommonBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CommonController());
  }
}
