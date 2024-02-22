import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Controller/States/AppLang_Controller.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool langueFR = true;
  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    langueFR = prefs.getBool("langueFR") ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: GetBuilder<AppLang>(
            init: AppLang(),
            builder: (controller) {
              return DropdownButton(
                items: [
                  DropdownMenuItem(
                    value: 'ar',
                    child: CountryFlag.fromCountryCode(
                      'TN',
                      borderRadius: 10,
                      height: 30,
                      width: 30,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'fr',
                    child: CountryFlag.fromCountryCode(
                      'fr',
                      borderRadius: 10,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
                value: controller.appLocalLang,
                onChanged: (x) {
                  controller.changeLanguage(x!);
                  Get.updateLocale(Locale(x));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
