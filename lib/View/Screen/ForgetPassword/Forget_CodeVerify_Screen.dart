import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../Setting/Colors/colorsSetting.dart';
import '../../Widget/TextStyle.dart';
import 'NewPassword_Screen.dart';

class CodeVerificationPassword extends StatefulWidget {
  const CodeVerificationPassword({super.key});

  @override
  State<CodeVerificationPassword> createState() =>
      _CodeVerificationPasswordState();
}

class _CodeVerificationPasswordState extends State<CodeVerificationPassword> {
  TextEditingController textEditCon1 = TextEditingController();
  TextEditingController textEditCon2 = TextEditingController();
  TextEditingController textEditCon3 = TextEditingController();
  TextEditingController textEditCon4 = TextEditingController();
  TextEditingController textEditCon5 = TextEditingController();
  TextEditingController textEditCon6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Ionicons.arrow_back_outline,
          ),
        ),
      ),
      body: Form(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png"),
                SizedBox(
                  height: Get.height * .02,
                ),
                Text(
                  "NewPassword".tr,
                  style: Style().styleBoldTitle,
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                Text(
                  "NewPasswordDiscription".tr,
                  style: Style().styleBoldDiscription,
                ),
                SizedBox(
                  height: Get.height * .05,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      box(textEditCon1),
                      box(textEditCon2),
                      box(textEditCon3),
                      box(textEditCon4),
                      box(textEditCon5)
                    ],
                  ),
                ),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewPassword()));
                      },
                      child: FittedBox(
                        child: Text(
                          "Verifier".tr,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Resend".tr,
                      style: Style().styleTextGray,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "ResendCode".tr,
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
    );
  }

  Widget box(controller) {
    return SizedBox(
      height: Get.width * .15,
      width: Get.width * .15,
      child: TextFormField(
        controller: controller,
        //to go to the ather fild
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: Theme.of(context).textTheme.headlineMedium,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          hintText: "0",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          fillColor: ConstantColor().grey1,
        ),
      ),
    );
  }
}
