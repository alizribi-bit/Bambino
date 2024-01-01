import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Controller/States/User_Controller.dart';
import '../../../Setting/Colors/colorsSetting.dart';
import '../../Widget/InputFilde_Widget.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  UserController userController = UserController();
  TextEditingController PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset("assets/logo.png"),
              SizedBox(
                height: Get.height * .02,
              ),
              Text(
                "NewPassword".tr,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              Text(
                "NewPasswordDiscription".tr,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: ConstantColor().grey4),
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              textFormFieldWidget(
                  context,
                  PasswordController,
                  TextInputType.visiblePassword,
                  "password".tr,
                  FontAwesomeIcons.lock,
                  userController.password,
                  userController),
              SizedBox(
                height: Get.height * .03,
              ),
              textFormFieldWidget(
                  context,
                  userController.passwordController,
                  TextInputType.visiblePassword,
                  "ConfirmPas".tr,
                  FontAwesomeIcons.lock,
                  userController.password,
                  userController),
              SizedBox(
                height: Get.height * .05,
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
                    onPressed: () {},
                    child: Text(
                      "confirmation".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
