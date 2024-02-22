import 'package:bambino/Model/doctor_model.dart';
import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:bambino/View/Widget/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

// ignore: must_be_immutable
class DoctorCardWidget extends StatefulWidget {
  late Doctor doctor;

  DoctorCardWidget({super.key, required this.doctor});

  @override
  State<DoctorCardWidget> createState() => _DoctorCardWidgetState();
}

class _DoctorCardWidgetState extends State<DoctorCardWidget> {
  @override
  Widget build(BuildContext context) {
    bool testHeartColor = false;
    return Container(
      height: Get.width * 0.45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ConstantColor().grey1.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ConstantColor().grey2,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              widget.doctor.photo!,
              height: Get.width * 0.35,
              width: Get.width * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.doctor.fullName!,
                        style: Style().styleBoldTitle,
                      ),
                      IconButton(
                        icon: testHeartColor == false
                            ? const Icon(Ionicons.heart_outline)
                            : const Icon(
                                Ionicons.heart_circle_sharp,
                                color: Colors.red,
                              ),
                        onPressed: () {
                          print("********** test $testHeartColor **********");

                          setState(() {
                            if (testHeartColor == false) {
                              testHeartColor = true;
                            } else {
                              testHeartColor = false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(
                    color: ConstantColor().grey2,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    widget.doctor.speciality!,
                    style: Style().styleListTile,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Ionicons.location_outline),
                    ),
                    Text(
                      widget.doctor.lacation!,
                      style: Style().styleBoldTitle,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          widget.doctor.rating! < 4.5
                              ? Icon(
                                  Ionicons.star_half_outline,
                                  color: ConstantColor().starColor,
                                )
                              : Icon(
                                  Ionicons.star_outline,
                                  color: ConstantColor().starColor,
                                ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text("${widget.doctor.rating!}"),
                          ),
                        ],
                      ),
                      Text("${widget.doctor.reviews!} Reviews")
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
