import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
//********
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//**********
  var isLoggedIn = false.obs;
  var showError = false.obs;
  var emailU = "";
  var password = "";
  String errorMsg = "";

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('emailU')) {
      if (prefs.getString('emailU') == emailU &&
          prefs.getString('password') == password) {
        isLoggedIn(true);
      } else {
        isLoggedIn(false);
      }
    }
  }

  Future<String?> getemeil() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.getString('emailU');
  }

  //Do login method to submit data
  Future<void> doLogin() async {
    if (validateLoginCredentials()) {
      /* if (validEmail(emailController.text) == null &&
          validEmail(passwordController.text) == null) { */
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('emailU', emailController.text.trim().toString());
      prefs.setString('password', passwordController.text.trim().toString());
      emptyController();
      showError(false);
      isLoggedIn(true);
      Get.offAllNamed('/home');
      isLoggedIn(false);
    } /* else {
        errorMsg = "Incorrect Username or Password!";
        showError(false);
        showError(true);
        isLoggedIn(false);
      }
    } */
    else {
      errorMsg = "*Fields cannot be empty!";
      showError(false);
      showError(true);
      isLoggedIn(false);
    }
  }

  String? validEmail(String value) {
    if (!GetUtils.isEmail(value.trim())) {
      return "Please Provide Valid Email";
    }
    return null;
  }

  String? validPassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  bool validateLoginCredentials() {
    if (emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void emptyController() {
    emailController.text = "";
    passwordController.text = "";
  }

  Future<void> emptyPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');
  }
}





/*   @override
  void onInit() async {
    super.onInit();

    LocalStorageUser localStorageUser = LocalStorageUser();
    emailU = await localStorageUser.getUserFromStorage;
    Get.updateLocale(Locale(emailU));
    //pass = await localStorageUser.getUserFromStorage;
    // Get.updateLocale(Locale(pass));
    update();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validEmail(String value) {
    if (!GetUtils.isEmail(value.trim())) {
      return "Please Provide Valid Email";
    }
    return null;
  }

  String? validPassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void login() {
/*     final isValid = formKey.currentState!.validate();
    if (!isValid) {
      print("********  Ok 0  **********");
      return;
    } */
    isLoading.value = true;
    formKey.currentState!.save();
    print("********  Ok  1 **********");
    try {
      changeUser(emailController.text, passwordController.text);
      Get.updateLocale(Locale(emailController.text));
      update();
      Get.offAllNamed('/luncher');

      print("********  Ok 2  **********");
    } catch (e) {}
    print("********  Ok 3  **********");
    isLoading.value = false;
  }

  void changeUser(String email, String passw) {
    LocalStorageUser localStorageUser = LocalStorageUser();
    emailU = email;
    // pass = passw;
    localStorageUser.saveUserOnStorage(email);
    //test test test

    update();
  }
 */


