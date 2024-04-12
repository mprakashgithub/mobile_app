import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/bindings/common_binding.dart';
import 'constants/app_constants.dart';
import 'constants/const_colors.dart';
import 'localizations_delegate.dart';
import 'routes/routes.dart';
import 'services/configuration/controller/configuration_controller.dart';
import 'services/configuration/controller/configuration_controller.dart'
    as messages;
import 'services/configuration/load_localization.dart';
import 'utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var languages = await LoadLocalization().init();
  runApp(MyApp(languages));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> languages;

  const MyApp(this.languages, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = Get.find<ConfigurationController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return GetMaterialApp(
      // navigatorKey: globalAliceInstance.getNavigatorKey(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        LocalizationDelegate(),
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('hi', 'HI'),
      ],
      initialRoute: AppRoutes.initial,
      initialBinding: CommonBinding(),
      getPages: AppRoutes.routes,
      locale: controller.locale.value,
      translations: messages.Messages(widget.languages),
      // navigatorObservers: <NavigatorObserver>[observer],
      fallbackLocale: Locale(
        AppConstants.languages.first.languageCode,
        AppConstants.languages.first.countryCode,
      ),
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.gothicA1TextTheme(Theme.of(context).textTheme),
        appBarTheme: const AppBarTheme(
          color: ConstColors.primary_color,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: ConstColors.white,
      ),
    );
  }
}
