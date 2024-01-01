import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/States/AppLang_Controller.dart';

class LongueScreen extends StatefulWidget {
  const LongueScreen({super.key});

  @override
  State<LongueScreen> createState() => _LongueScreenState();
}

class _LongueScreenState extends State<LongueScreen> {
  bool _isFR = false;
  bool _isAR = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Choisir votre langue préférée",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const Text(
                "اختر لغتك المفضلة",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(
                height: Get.height * .04,
              ),
              GetBuilder<AppLang>(
                init: AppLang(),
                builder: (controller) {
                  //var value = controller.appLocalLang;
                  return Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isAR = true;
                              _isFR = false;
                              controller.changeLanguage('ar');
                              Get.updateLocale(const Locale('ar'));
                            });
                          },
                          child: Container(
                            height: Get.height * .19,
                            width: Get.width * .37,
                            decoration: _isAR
                                ? BoxDecoration(
                                    boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 3.2,
                                          color: Colors.black87,
                                        ),
                                      ],
                                    borderRadius: BorderRadius.circular(23),
                                    color: ConstantColor().grey1)
                                : const BoxDecoration(
                                    color: Colors.white,
                                  ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CountryFlag.fromCountryCode(
                                    'TN',
                                    borderRadius: 23,
                                    height: Get.height * .12,
                                    width: Get.width * .4,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "عربي",
                                    style: TextStyle(
                                        fontSize: Get.width * .042,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .03,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isAR = false;
                              _isFR = true;
                              controller.changeLanguage('fr');
                              Get.updateLocale(const Locale('fr'));
                            });
                          },
                          child: Container(
                            height: Get.height * .19,
                            width: Get.width * .37,
                            decoration: _isFR
                                ? BoxDecoration(
                                    boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 3.2,
                                          color: Colors.black87,
                                        ),
                                      ],
                                    borderRadius: BorderRadius.circular(23),
                                    color: ConstantColor().grey1)
                                : const BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CountryFlag.fromCountryCode(
                                    'fr',
                                    borderRadius: 23,
                                    height: Get.height * .12,
                                    width: Get.width * .4,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Francais",
                                    style: TextStyle(
                                        fontSize: Get.width * .042,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
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
                      Get.offAllNamed('/login');
                    },
                    child: Text(
                      "next".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



/* GetBuilder<AppLang>(
                init: AppLang(),
                builder: (controller) {
                  return DropdownButton(
                    items: [
                      DropdownMenuItem(
                        value: 'ar',
                        child: Column(
                          children: [
                            CountryFlag.fromCountryCode(
                              'TN',
                              borderRadius: 10,
                              height: Get.height * .1,
                              width: Get.width * .2,
                            ),
                            const Text("Arabe"),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'fr',
                        child: Column(
                          children: [
                            CountryFlag.fromCountryCode(
                              'fr',
                              borderRadius: 10,
                              height: Get.height * .1,
                              width: Get.width * .2,
                            ),
                            const Text("Francais"),
                          ],
                        ),
                      ),
                    ],
                    value: controller.appLocalLang,
                    onChanged: (value) {
                      controller.changeLanguage(value!);
                      Get.updateLocale(Locale(value));
                    },
                  );
                },
              ), */