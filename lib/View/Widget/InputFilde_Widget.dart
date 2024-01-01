import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextFormField textFormFieldWidget(
    context, controller, type, labele, icon, controllerValue, userController) {
  return TextFormField(
    controller: controller,
    // autocorrect: false,
    keyboardType: type,
    onSaved: (value) {
      controllerValue = value!;
    },
    validator: (value) {
      return userController.validEmail(value!);
    },
    decoration: DecorationWidget(context, labele, icon),
    cursorColor: ConstantColor().grey4,
  );
}

InputDecoration DecorationWidget(BuildContext context, String text, icon) {
  return InputDecoration(
    fillColor: ConstantColor().grey1,
    filled: true,
    prefixIcon: Padding(
      padding: const EdgeInsets.fromLTRB(15, 13, 3, 13),
      child: FaIcon(
        icon,
        size: 20,
        color: ConstantColor().grey4,
      ),
    ),
    label: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(color: ConstantColor().grey4),
      ),
    ),
    contentPadding: EdgeInsets.zero,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        width: 2,
        color: Colors.pink,
      ),
    ),
  );
}
