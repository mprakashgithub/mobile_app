import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app_localizations.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/view/mainpage/mainpage_controller.dart';
import 'package:mobile_app/view/mall_info.dart';

import '../../services/check_internet_connection.dart';

class MainPage extends GetView<MainpageController> {
  const MainPage({super.key});
  static const String id = "/MainPage";

  // @override
  // State<MainPage> createState() => _MainPageState();

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

// class _MainPageState extends State<MainPage> {
  // final MainpageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
        actions: [
          IconButton(
              onPressed: () {
                pushNamed(MallInfo.id);
              },
              icon: const Icon(Icons.arrow_right))
        ],
      ),
      body: Obx(
        () => SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.trans("label_language")),
              Text(controller.count.value.toString()),
              MaterialButton(
                  onPressed: () async {
                    if (await hasInternetAccess()) {
                      controller.increaseCount();
                    } else {
                      showSnackBar("no_internet_message");
                    }
                  },
                  color: Colors.amber,
                  child: const Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}
