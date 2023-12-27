import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/States/AppLang_Controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool langueFR = true;
  String? email = "";

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    langueFR = prefs.getBool("langueFR") ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              //Comment changer les langeue *** tres tres importante
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
              //test langue
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
              ),
              FutureBuilder<String>(
                future: _getUsername(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('Welcome, ${snapshot.data}');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('emailU') ?? 'Unknown User';
  }
}
