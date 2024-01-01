import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Setting/Colors/colorsSetting.dart';
import '../../Widget/TextStyle.dart';

class ScreenIntroduction extends StatefulWidget {
  const ScreenIntroduction({super.key});

  @override
  State<ScreenIntroduction> createState() => _ScreenIntroductionState();
}

class _ScreenIntroductionState extends State<ScreenIntroduction> {
  //Controller to Keep track of which page we're on
  PageController _controller = PageController();
  //Keep track of ti we are one the last page or not
  bool onLastPage = false;
  //Keep track color Button if false=> blue else pink
  bool wichPageColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffdccbf1),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (indexPage) {
              setState(() {
                onLastPage = (indexPage == 2);
              });
              setState(() {
                wichPageColor = (indexPage == 1);
              });
              print("$wichPageColor ******************");
            },
            children: [
              PageViewModelWidget(
                  "text1".tr, "text1Disc".tr, "assets/Image1.png"),
              PageViewModelWidget(
                  "text2".tr, "text2Disc".tr, "assets/Image2.png"),
              PageViewModelWidget(
                  "text3".tr, "text3Disc".tr, "assets/Image7.png")
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Padding(
              padding: EdgeInsets.only(bottom: Get.height * .08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  onLastPage
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
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
                                Get.offNamed("/lang");
                              },
                              child: Text(
                                "done".tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: wichPageColor
                                    ? ConstantColor().pink
                                    : ConstantColor().blue,
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
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeIn);
                              },
                              child: Text(
                                "Next".tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: Get.height * .03,
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                        dotColor: ConstantColor().grey1,
                        activeDotColor: wichPageColor
                            ? ConstantColor().blue
                            : ConstantColor().pink,
                        dotHeight: 13,
                        dotWidth: 20),
                  ),
                  SizedBox(
                    height: Get.height * .03,
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      "Skip".tr,
                      style: TextStyle(
                          color: ConstantColor().grey4,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget PageViewModelWidget(text, discription, image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.fitWidth,
          width: Get.width,
          height: Get.height * .55,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Style().styleBoldTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            discription,
            textAlign: TextAlign.center,
            style: Style().styleBoldDiscription,
          ),
        )
      ],
    );
  }
}
