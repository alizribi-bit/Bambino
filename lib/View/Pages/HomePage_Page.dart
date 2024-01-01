import 'package:bambino/View/Screen/ScreensOfTheHomePAge/Appointment_Screen.dart';
import 'package:bambino/View/Screen/ScreensOfTheHomePAge/Home_Screen.dart';
import 'package:bambino/View/Screen/ScreensOfTheHomePAge/Location_Screen.dart';
import 'package:bambino/View/Screen/ScreensOfTheHomePAge/Profile_Screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //UserController userController = UserController();
  int selectedItem = 0;
  void updateIndex(index) {
    setState(() {
      selectedItem = index;
    });
  }

  List<Widget> _myList = [
    HomeScreen(),
    LocationScreen(),
    AppointmentScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _myList[selectedItem],
        bottomNavigationBar: ConvexAppBar(
          items: [
            _tabItem(FaIcon(FontAwesomeIcons.home)),
            _tabItem(FaIcon(FontAwesomeIcons.locationPin)),
            _tabItem(FaIcon(FontAwesomeIcons.calendar)),
            _tabItem(FaIcon(FontAwesomeIcons.person))
          ],
          initialActiveIndex: 0,
          onTap: updateIndex,
        ),
      ),
    );
  }

  TabItem _tabItem(icon) {
    return TabItem(icon: icon);
  }
}

/* bool langueFR = true;
  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    langueFR = prefs.getBool("langueFR") ?? true;
  } */
/* //Comment changer les langeue *** tres tres importante
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
                    onChanged: (x) {
                      controller.changeLanguage(x!);
                      Get.updateLocale(Locale(x));
                    },
                  );
                },
              ), */
/*   Future<String> _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? 'Unknown User';
  }
}
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
              ), */
