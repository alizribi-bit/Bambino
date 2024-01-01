import 'dart:io';

import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/States/User_Controller.dart';
import '../Widget/InputFilde_Widget.dart';
import 'package:intl/intl.dart';

class SignInProfile extends StatefulWidget {
  const SignInProfile({super.key});

  @override
  State<SignInProfile> createState() => _SignInProfileState();
}

class _SignInProfileState extends State<SignInProfile> {
  File? _image;
  final _picker = ImagePicker();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('photo', _image!.path.toString());
    }
  }

  UserController userController = UserController();
  final format = DateFormat("yyyy-MM-dd");
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          ),
          title: Text("FillProfile".tr),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: userController.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: Get.width * .25,
                                  backgroundImage: FileImage(
                                    _image!,
                                  ),
                                )
                              : FaIcon(
                                  FontAwesomeIcons.circleUser,
                                  color: Colors.grey.shade400,
                                  size: Get.width * .5,
                                ),
                          Positioned(
                            bottom: Get.width * .03,
                            right: Get.width * .04,
                            child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _openImagePicker();
                                });
                              },
                              child: FaIcon(
                                FontAwesomeIcons.penSquare,
                                color: ConstantColor().blue,
                                size: Get.width * .09,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    textFormFieldWidget(
                        context,
                        userController.userNameController,
                        TextInputType.text,
                        "NomPrenom".tr,
                        FontAwesomeIcons.user,
                        userController.emailU,
                        userController),
                    const SizedBox(
                      height: 30,
                    ),
                    textFormFieldWidget(
                        context,
                        userController.emailController,
                        TextInputType.emailAddress,
                        "email".tr,
                        FontAwesomeIcons.envelope,
                        userController.emailU,
                        userController),
                    const SizedBox(
                      height: 30,
                    ),
                    //
                    /*    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}"),
                        IconButton(
                            onPressed: () async {
                              final DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050));
                              if (dateTime != null) {
                                setState(() {
                                  selectedDate = dateTime;
                                });
                              }
                            },
                            icon: c
                      ],
                    ), */
                    TextField(
                      readOnly: true,
                      textInputAction: TextInputAction.none,
                      controller: userController.dateBirthController,
                      decoration: DecorationWidget(
                          context, "DateNaiss".tr, FontAwesomeIcons.calendar),
                      /*  const InputDecoration(
                        icon: FaIcon(FontAwesomeIcons.calendar),
                        label: Text("DateNaiss"),
                      ), */
                      onTap: () async {
                        {
                          final DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2050));
                          if (dateTime != null) {
                            setState(() {
                              selectedDate = dateTime;
                              userController.dateBirthController.text =
                                  DateFormat("yyyy-MM-dd").format(selectedDate);
                            });
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Obx(() => userController.showError.value
                        ? Text(
                            userController.errorMsg,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12),
                          )
                        : const SizedBox.shrink()),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
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
                            _showMyDialog();
                          },
                          child: Text(
                            "Sauvegarder".tr,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 2), () {
          userController.SignedIn2();
        });
        return AlertDialog(
          title: Center(
            child: CircleAvatar(
              radius: Get.width * 0.2,
              backgroundColor: ConstantColor().blue,
              child: FaIcon(
                FontAwesomeIcons.circleCheck,
                size: Get.width * 0.25,
                color: Colors.white,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "Felicitations".tr,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "FelicitationsDiscription".tr,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: ConstantColor().grey4),
                ),
                SizedBox(
                  height: Get.height * .05,
                ),
                const CircularProgressIndicator.adaptive()
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
