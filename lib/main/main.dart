import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_app/firebase_options.dart';
import 'package:target_app/utils/app_translations.dart';

import '../utils/injection_config.dart';
import 'factories/login/login_page_factory.dart';
import 'factories/home/home_page_factory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sharedPreferences = await SharedPreferences.getInstance();

  configureInjection(sharedPreferences);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Target App',
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('pt', 'BR'),
      initialRoute: '/home-page',
      getPages: [
        GetPage(
          name: '/',
          page: makeLoginPage,
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/home-page',
          page: makeHomePage,
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
