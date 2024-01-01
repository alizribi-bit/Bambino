import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../Controller/States/User_Controller.dart';
import '../../Setting/Colors/colorsSetting.dart';
import '../Widget/InputFilde_Widget.dart';
import '../Widget/TextStyle.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    UserController userController = UserController();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: userController.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage("assets/logo.png"),
                    ),
                    Text(
                      "CreerCompte".tr,
                      style: Style().styleBoldTitle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "CreerCompteDescription".tr,
                      style: Style().styleBoldDiscription,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    textFormFieldWidget(
                        context,
                        userController.userNameController,
                        TextInputType.text,
                        "NomPrenom".tr,
                        Ionicons.person_circle_outline,
                        userController.emailU,
                        userController),
                    const SizedBox(
                      height: 30,
                    ),
                    textFormFieldWidget(
                        context,
                        userController.emailController,
                        TextInputType.emailAddress,
                        "email".tr,
                        Ionicons.mail_open_outline,
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
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12),
                          )
                        : const SizedBox.shrink()),
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
                            userController.SignedIn1();
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
                                      "CreerCompte".tr,
                                      style:
                                          const TextStyle(color: Colors.white),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AvezCompte".tr,
                          style: Style().styleTextGray,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAllNamed('/login');
                          },
                          child: Text(
                            "SignUp".tr,
                            style: Style().styleTextButton,
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
      ),
    );
  }
}
