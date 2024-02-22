import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListConstante {
  final List<ListItem> items = [
    ListItem("A", ConstantColor().pink, ""),
    ListItem("Cardiologie".tr, ConstantColor().blue, "assets/heart.svg"),
    ListItem("B", ConstantColor().pink, ""),
    ListItem("General".tr, ConstantColor().blue, "assets/general.svg"),
    ListItem("C", ConstantColor().blue, ""),
    ListItem("D", ConstantColor().pink, ""),
    ListItem("E", ConstantColor().blue, ""),
    ListItem("Vaccinate".tr, ConstantColor().pink, "assets/vaccint.svg"),
  ];
}

class ListItem {
  final String label;
  final Color color;
  final String imagePath;

  ListItem(this.label, this.color, this.imagePath);
}
