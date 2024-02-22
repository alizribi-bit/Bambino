import 'package:bambino/Setting/lang/translationSetting.dart';
import 'package:bambino/View/Pages/HomePage_Page.dart';
import 'package:bambino/View/Screen/LoginSignin/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/Pages/Luncher_Page.dart';
import 'View/Screen/LoginSignin/ProfileSignin_Screen.dart';
import 'View/Screen/Longue_Screen.dart';
import 'View/Screen/SeplashScreens/Home_Seplash_Screen.dart';
import 'View/Screen/SeplashScreens/Introduction_Screen.dart';
import 'View/Screen/SeplashScreens/Login_Seplash_Screen.dart';
import 'View/Screen/LoginSignin/Signin_Screen.dart';

Future<void> main() async {
  await GetStorage.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? login = prefs.getString('email');

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: login == null
          ? const SeplashScreenLogin()
          : const SeplashScreenHome(),
      getPages: [
        GetPage(name: '/', page: () => const SeplashScreenLogin()),
        GetPage(name: '/luncher', page: () => const LuncherPage()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/signIn', page: () => const SignUpScreen()),
        GetPage(name: '/lang', page: () => const LongueScreen()),
        GetPage(name: '/signInProfile', page: () => const SignInProfile()),
        GetPage(
            name: '/ScreenIntroduction',
            page: () => const ScreenIntroduction()),
      ],
      translations: Translation(),
      locale: const Locale('fr'),
      fallbackLocale: const Locale('fr'),
    ),
  );
}
