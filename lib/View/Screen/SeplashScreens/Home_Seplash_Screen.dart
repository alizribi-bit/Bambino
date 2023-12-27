import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widget/SeplashCard_Widget.dart';

class SeplashScreenHome extends StatefulWidget {
  const SeplashScreenHome({super.key});

  @override
  State<SeplashScreenHome> createState() => _SeplashScreenHomeState();
}

class _SeplashScreenHomeState extends State<SeplashScreenHome> {
  bool alreadyUsed = false;

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUsed") ?? false;
  }

  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    getData();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Get.offNamed("/home");
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _leftright = -(MediaQuery.sizeOf(context).width * .225);
    double _left = (MediaQuery.sizeOf(context).width * .272);
    double _bottomtop = -(MediaQuery.sizeOf(context).height * .04);
    //const double _center = Get.height;
    return Scaffold(
      backgroundColor: ConstantColor().darkblue,
      body: Stack(
        children: [
          Center(
            child: Stack(
              children: [
                widgetContainer(
                  Colors.white,
                  Get.width * .46,
                  Get.height * .35,
                  const Image(
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ],
            ),
          ),
          //topleft
          Positioned(
            left: _leftright,
            top: _bottomtop,
            child: widgetContainer(
              ConstantColor().blue,
              Get.width * .46,
              Get.height * .35,
              const SizedBox(),
            ),
          ),
          //Centerleft
          Positioned(
            left: _leftright,
            top: Get.height * .33 - 6,
            child: widgetContainer(
              //Colors.teal.shade300,
              Colors.transparent,
              Get.width * .46,
              Get.height * .35,
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/Image3.png"),
                ),
              ),
            ),
          ),
          //CenterRight
          Positioned(
            right: _leftright,
            top: Get.height * .33 - 6,
            child: widgetContainer(
              Colors.transparent,
              Get.width * .46,
              Get.height * .35,
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/Image5.PNG"),
                ),
              ),
            ),
          ),
          //BottomRight
          Positioned(
            right: _leftright,
            bottom: _bottomtop,
            child: widgetContainer(
              ConstantColor().blue,
              Get.width * .46,
              Get.height * .35,
              const SizedBox(),
            ),
          ),
          //topRight
          Positioned(
            right: _leftright,
            top: _bottomtop,
            child: widgetContainer(
              ConstantColor().pink,
              Get.width * .46,
              Get.height * .35,
              const SizedBox(),
            ),
          ),
          //CenterTop
          Positioned(
            left: _left,
            top: _bottomtop,
            child: widgetContainer(
              Colors.transparent,
              Get.width * .46,
              Get.height * .35,
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/Image1.png"),
                ),
              ),
            ),
          ),
          //CenterBottom
          Positioned(
            left: _left,
            bottom: _bottomtop,
            child: widgetContainer(
              Colors.transparent,
              Get.width * .46,
              Get.height * .35,
              ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/Image6.PNG"),
                ),
              ),
            ),
          ),
          //Bottomleft
          Positioned(
            left: _leftright,
            bottom: _bottomtop,
            child: widgetContainer(
              ConstantColor().pink,
              Get.width * .46,
              Get.height * .35,
              const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
