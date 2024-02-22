import 'package:bambino/View/Widget/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';

import '../../Setting/Colors/colorsSetting.dart';

ListTile listTileWidget(icon, text, Function() function) {
  print("${GetStorage().read('lang')} ======");
  return ListTile(
    leading: Icon(
      icon,
      size: Get.width * .08,
      color: ConstantColor().listTile,
    ),
    title: Padding(
      padding: EdgeInsets.only(left: Get.width * 0.035),
      child: Text(
        text,
        style: Style().styleListTile,
      ),
    ),
    trailing: Icon(
      GetStorage().read('lang') == 'fr'
          ? Ionicons.chevron_forward
          : Ionicons.chevron_back,
      color: ConstantColor().listTile,
      size: Get.width * .07,
    ),
    onTap: function,
  );
}
