import 'package:get/get.dart';
import 'package:mobile_app/view/mainpage/mainpage_controller.dart';

class MainpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainpageController());
  }
}
