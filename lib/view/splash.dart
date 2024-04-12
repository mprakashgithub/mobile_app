import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/view/mainpage/mainpage.dart';

import '../common/controller/common_controller.dart';
import '../common/view/common_scaffold.dart';
import '../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "/SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final CommonController controller = Get.find();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      navigationPage(controller);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CommonScaffold(
        body: Center(
      child: Text("Pacific Loyalty App"),
    ));
  }

  navigationPage(CommonController controller) {
    pushNamedAndRemoveUntil(MainPage.id);
  }
}
