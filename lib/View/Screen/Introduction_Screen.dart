import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../Pages/Luncher_Page.dart';

class IntroductionScreenHome extends StatefulWidget {
  const IntroductionScreenHome({super.key});

  @override
  State<IntroductionScreenHome> createState() => _IntroductionScreenHomeState();
}

class _IntroductionScreenHomeState extends State<IntroductionScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [],
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        done: const Text(
          "Done",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        onDone: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const LuncherPage(),
            ),
          );
        },
        showNextButton: true,
        baseBtnStyle: TextButton.styleFrom(
          backgroundColor: Colors.grey.shade200,
        ),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Colors.grey,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            activeColor: Colors.lightBlueAccent),
      ),
    );
  }
}
