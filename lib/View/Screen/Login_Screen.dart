import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:bambino/View/Screen/ForgetPassword/Forget_Email_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../Controller/States/User_Controller.dart';
import '../Widget/InputFilde_Widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserController userController = UserController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: userController.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/logo.png"),
                  ),
                  Text(
                    "bonjour".tr,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "bonj".tr,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: ConstantColor().grey4),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  textFormFieldWidget(
                      context,
                      userController.emailController,
                      TextInputType.emailAddress,
                      "email".tr,
                      Ionicons.mail_outline,
                      userController.emailU,
                      userController),
                  const SizedBox(
                    height: 30,
                  ),
                  textFormFieldWidget(
                      context,
                      userController.passwordController,
                      TextInputType.visiblePassword,
                      "password".tr,
                      Ionicons.lock_closed_outline,
                      userController.password,
                      userController),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(() => userController.showError.value
                      ? Text(
                          userController.errorMsg,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        )
                      : const SizedBox.shrink()),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ConstantColor().blue,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 10,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'CormorantGaramond',
                          ),
                        ),
                        onPressed: () {
                          userController.doLogin();
                        },
                        child: FittedBox(
                          child: Obx(
                            () => userController.isLoggedIn.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    "conx".tr,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      thickness: 1,
                      color: ConstantColor().grey4,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassworEmail()));
                    },
                    child: Text(
                      "motpass".tr,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "neauvCompt".tr,
                        style: const TextStyle(fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed('/signIn');
                        },
                        child: Text(
                          "SignUp".tr,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
