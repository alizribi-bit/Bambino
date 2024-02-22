import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Card cardHomeDoctorWidget() {
  return Card(
    elevation: 1,
    shadowColor: ConstantColor().grey2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            height: Get.height * 0.25,
            "assets/Image8.png",
            fit: BoxFit.fill,
          ),
          Positioned(
            top: -(Get.width * 0.2),
            left: -(Get.width * 0.2),
            child: ClipOval(
              child: Container(
                height: Get.width * 0.5,
                width: Get.width * 0.5,
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
