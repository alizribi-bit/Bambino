import 'package:bambino/Setting/Lists/homeList.dart';
import 'package:bambino/View/Widget/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Setting/Colors/colorsSetting.dart';
import '../../Widget/CardHomeDoctor_Widget.dart';
import '../../Widget/CategtegoriHome_Widget.dart';
import 'Doctor&Appointment/DoctorList_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller = PageController();
  final ListConstante _listConstante = ListConstante();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: Get.height * 0.25,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _controller,
                        onPageChanged: (indexPage) {},
                        children: [
                          cardHomeDoctorWidget(),
                          cardHomeDoctorWidget(),
                          cardHomeDoctorWidget()
                        ],
                      ),
                      Container(
                        alignment: const Alignment(0, 0.9),
                        child: SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          effect: ExpandingDotsEffect(
                              dotColor: ConstantColor().grey1,
                              activeDotColor: ConstantColor().grey2,
                              dotHeight: 10,
                              dotWidth: 10),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Text(
                    "Categories".tr,
                    style: Style().styleBold1,
                  ),
                  trailing: TextButton(
                    child: Text(
                      "SeeAll".tr,
                      style: Style().styleW4001,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorListScreen(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.3,
                  // color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder<List<ListItem>>(
                      future: Future.value(_listConstante.items),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return SizedBox.expand(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 6.0,
                                      mainAxisSpacing: 6.0,
                                      childAspectRatio: 0.75),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _listConstante.items.length,
                              itemBuilder: (context, index) {
                                return CardCategorie(snapshot.data![index]);
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                ListTile(
                  leading: Text(
                    "Centres".tr,
                    style: Style().styleBold1,
                  ),
                  trailing: TextButton(
                    child: Text(
                      "SeeAll".tr,
                      style: Style().styleW4001,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
