import 'dart:io';

import 'package:bambino/Model/user_model.dart';
import 'package:bambino/View/Screen/ScreensOfTheHomePAge/ProfileScreens/Setting_Screen.dart';
import 'package:bambino/View/Widget/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controller/States/User_Controller.dart';
import '../../../Setting/Colors/colorsSetting.dart';
import '../../Widget/ListTile_Widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  /* Future<User> _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User.fromJson("firstName") =prefs.getString('email') ;

     return;
  } */

  Future<User> _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? firstName = prefs.getString('firstName');
    String? lastName = prefs.getString('lastName');
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    String? dateNaissance = prefs.getString('dateOfBirth');
    String? image = prefs.getString('photo');

    return User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      dateNaissance: dateNaissance,
      image: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "profile".tr,
            style: Style().styleBoldTitle,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<User>(
                future: _getUserInfo(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Column(
                      children: [
                        Stack(
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
                              bottom: Get.width * .03,
                              right: Get.width * .04,
                              child: GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    _openImagePicker();
                                  });
                                },
                                child: Icon(
                                  Icons.edit_square,
                                  color: ConstantColor().blue,
                                  size: Get.width * .09,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * .01,
                        ),
                        Text(snapshot.data!.firstName!),
                        SizedBox(
                          height: Get.height * .01,
                        ),
                        Text(snapshot.data!.email!),
                      ],
                    );
                  }
                },
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              Text(
                "+216 99 999 999",
                style: Style().styleBoldDiscription,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: listTileWidget(
                    Ionicons.person_circle_outline, "EditProfile".tr, () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: listTileWidget(
                    Ionicons.heart_outline, "Favorite".tr, () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: listTileWidget(
                    Ionicons.notifications_outline, "Notifications".tr, () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    listTileWidget(Ionicons.settings_outline, "Setting".tr, () {
                  function(Setting());
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: listTileWidget(
                    Ionicons.help_circle_outline, "Help".tr, () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: listTileWidget(
                    Ionicons.shield_half_outline, "TermsConditions".tr, () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: listTileWidget(
                  Ionicons.log_out_outline,
                  "LogOut".tr,
                  () {
                    _showBottomSheet();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PersistentBottomSheetController<dynamic>? _showBottomSheet() {
    PersistentBottomSheetController<dynamic>? bottomSheetController;
    UserController _userController = UserController();
    bottomSheetController = showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          height: Get.height * 0.2,
          width: Get.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "LogOut".tr,
                  style: Style().styleBoldTitle,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Divider(
                    thickness: 2,
                    color: ConstantColor().grey1,
                  ),
                ),
                Text(
                  "LogOutDiscription".tr,
                  style: Style().styleBoldDiscription,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: Get.width * .4,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ConstantColor().grey1,
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
                            bottomSheetController!.close();
                          },
                          child: Text(
                            "Cancel".tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: Get.width * .5,
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
                            _userController.emptyPrefs();
                            bottomSheetController!.close();
                          },
                          child: Text(
                            "yesLogout".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
    return bottomSheetController;
  }

  void function(page) {
    Navigator.push(context, MaterialPageRoute(builder: (contex) => page));
  }
}
