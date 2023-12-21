import 'package:bambino/Controller/States/AppLang_Controller.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LuncherPage extends StatefulWidget {
  const LuncherPage({super.key});

  @override
  State<LuncherPage> createState() => _LuncherPageState();
}

class _LuncherPageState extends State<LuncherPage> {
  bool langueFR = true;

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    langueFR = prefs.getBool("langueFR") ?? true;
  }

  String _selectedlang = 'fr';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                GetBuilder<AppLang>(
                  init: AppLang(),
                  builder: (controller) {
                    return DropdownButton(
                      items: [
                        DropdownMenuItem(
                          value: 'ar',
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("Arabe"),
                              ),
                              CountryFlag.fromCountryCode(
                                'TN',
                                borderRadius: 10,
                                height: 30,
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'fr',
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text("Francais"),
                              ),
                              CountryFlag.fromCountryCode(
                                'fr',
                                borderRadius: 10,
                                height: 30,
                                width: 30,
                              ),
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
                ),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "bonjour".tr,
                      style: const TextStyle(fontSize: 19),
                    ),
                    Text(
                      "bonj".tr,
                      style: const TextStyle(fontSize: 19),
                    ),
                    Text(
                      "conxGoogle".tr,
                      style: const TextStyle(fontSize: 19),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
