import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel PageTileViewWidget(
    {required String title, required String text, required String image}) {
  return PageViewModel(
    title: title,
    bodyWidget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    ),
    image: Center(
      child: Image.asset(
        image,
        fit: BoxFit.fitWidth,
      ),
    ),
  );
}
