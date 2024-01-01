import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:bambino/View/Screen/ScreensOfTheHomePAge/Appointment_Screen.dart';
import 'package:bambino/View/Screen/ScreensOfTheHomePAge/Home_Screen.dart';
import 'package:bambino/View/Screen/ScreensOfTheHomePAge/Location_Screen.dart';
import 'package:bambino/View/Screen/ScreensOfTheHomePAge/Profile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItem = 0;
  void updateIndex(index) {
    setState(() {
      selectedItem = index;
    });
  }

  final List<Widget> _myList = const [
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GNav(
            rippleColor: ConstantColor().grey1,
            hoverColor: ConstantColor().grey4,
            gap: 8,
            duration: const Duration(milliseconds: 400),
            activeColor: Colors.black,
            iconSize: 24,
            color: Colors.black,
            //tabBackgroundColor: ConstantColor().grey4,
            tabs: [
              _tabItem(
                selectedItem == 0 ? Ionicons.home : Ionicons.home_outline,
              ),
              _tabItem(
                selectedItem == 1
                    ? Ionicons.location
                    : Ionicons.location_outline,
              ),
              _tabItem(
                selectedItem == 2
                    ? Ionicons.calendar
                    : Ionicons.calendar_outline,
              ),
              _tabItem(
                selectedItem == 3 ? Ionicons.person : Ionicons.person_outline,
              )
            ],
            selectedIndex: selectedItem,
            onTabChange: (index) {
              setState(() {
                selectedItem = index;
              });
            },
          ),
        ),
      ),
    );
  }

  GButton _tabItem(icon) {
    return GButton(
      icon: icon,
      iconActiveColor: ConstantColor().darkbluedark,
      iconColor: ConstantColor().grey2,
    );
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
