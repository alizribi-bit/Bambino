import 'dart:io';

import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controller/States/User_Controller.dart';
import '../../Widget/InputFilde_Widget.dart';
import 'package:intl/intl.dart';

import '../../Widget/TextStyle.dart';

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

  UserController _userController = UserController();

  final format = DateFormat("yyyy-MM-dd");
  DateTime selectedDate = DateTime.now();

  void _getDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userController.emailController.text = prefs.getString('email')!;
    _userController.userNameController.text = prefs.getString('lastName')!;
  }

  @override
  void initState() {
    _getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GetStorage().read('lang') == 'fr'
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Ionicons.arrow_back_outline,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Ionicons.arrow_forward_outline,
                  ),
                ),
          title: Center(
            child: Text(
              "FillProfile".tr,
              style: Style().styleBoldTitle,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _userController.formKey,
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
                              : Icon(
                                  Ionicons.person_circle_outline,
                                  color: Colors.grey.shade400,
                                  size: Get.width * .5,
                                ),
                          Positioned(
                            bottom: Get.width * .05,
                            right: Get.width * .08,
                            child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _openImagePicker();
                                });
                              },
                              child: Icon(
                                Icons.edit_square,
                                color: Colors.blueAccent.shade100,
                                size: Get.width * .07,
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
                        _userController.userNameController,
                        TextInputType.text,
                        "NomPrenom".tr,
                        Ionicons.person_circle_outline,
                        _userController.emailU,
                        _userController,
                        _userController.userNameController.text),
                    const SizedBox(
                      height: 30,
                    ),
                    textFormFieldWidget(
                        context,
                        _userController.emailController,
                        TextInputType.emailAddress,
                        "email".tr,
                        Ionicons.mail_outline,
                        _userController.emailU,
                        _userController,
                        _userController.emailController.text),
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
                      controller: _userController.dateBirthController,
                      decoration: DecorationWidget(
                        context,
                        "DateNaiss".tr,
                        Ionicons.calendar,
                      ),
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
                              _userController.dateBirthController.text =
                                  DateFormat("yyyy-MM-dd").format(selectedDate);
                            });
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Obx(() => _userController.showError.value
                        ? Text(
                            _userController.errorMsg,
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
          _userController.SignedIn2();
        });
        return AlertDialog(
          title: Center(
            child: CircleAvatar(
              radius: Get.width * 0.2,
              backgroundColor: ConstantColor().blue,
              child: Icon(
                Ionicons.shield_checkmark_outline,
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
                  style: Style().styleBoldTitle,
                ),
                Text(
                  "FelicitationsDiscription".tr,
                  style: Style().styleBoldDiscription,
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
