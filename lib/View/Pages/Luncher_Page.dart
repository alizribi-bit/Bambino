import 'package:bambino/Controller/States/User_Controller.dart';
import 'package:bambino/View/Pages/HomePage_Page.dart';
import 'package:bambino/View/Screen/LoginSignin/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LuncherPage extends StatefulWidget {
  const LuncherPage({super.key});

  @override
  State<LuncherPage> createState() => _LuncherPageState();
}

class _LuncherPageState extends State<LuncherPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<UserController>(
          init: UserController(),
          builder: (controller) {
            // ignore: unnecessary_null_comparison
            return controller.emailU != null ? HomePage() : LoginScreen();
          },
        ),
      ),
    );
  }
}
