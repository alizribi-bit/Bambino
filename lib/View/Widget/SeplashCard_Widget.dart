import 'package:flutter/material.dart';

Container widgetContainer(Color color, width, height, Widget child) {
  return Container(
    width: width, //Get.width * .48,
    height: height,
    decoration: BoxDecoration(
      color: color,
      border: Border.all(width: 0.2),
      borderRadius: BorderRadius.circular(14.0),
    ),

    child: child,
  );
}
