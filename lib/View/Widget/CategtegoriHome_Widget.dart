import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Setting/Lists/homeList.dart';

Widget CardCategorie(ListItem item) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
          width: Get.width * 0.2,
          height: Get.width * 0.2,
          child: Card(
            color: item.color,
            elevation: 1,
            shadowColor: Colors.grey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Positioned(
                    top: -(Get.width * 0.2),
                    left: -(Get.width * 0.2),
                    child: ClipOval(
                      child: Container(
                        height: Get.width * 0.3,
                        width: Get.width * 0.3,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Center(
                    child: item.imagePath == ""
                        ? Container()
                        : SvgPicture.asset(
                            item.imagePath,
                            color: Colors.white,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Text(item.label)
    ],
  );
}
