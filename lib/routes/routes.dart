import 'package:get/get.dart';
import 'package:mobile_app/view/mainpage/mainpage.dart';
import 'package:mobile_app/view/mainpage/mainpage_binding.dart';
import 'package:mobile_app/view/mall_info.dart';

import '../view/splash.dart';

const Transition transition = Transition.rightToLeftWithFade;
const Duration transitionDuration = Duration(milliseconds: 200);

class AppRoutes {
  static const initial = SplashScreen.id;

  static final routes = [
    GetPage(
      name: SplashScreen.id,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: MainPage.id,
        page: () => const MainPage(),
        binding: MainpageBinding()),
    GetPage(
      name: MallInfo.id,
      page: () => const MallInfo(),
    ),

    // GetPage(
    //   name: ExampleClass.id,
    //   page: () => const ExampleClass(),
    //   bindings: [
    //     ExampleClassBinding(),
    //   ],
    // ),
  ];
}
