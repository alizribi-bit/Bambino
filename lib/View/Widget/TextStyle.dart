import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:flutter/material.dart';

class Style {
  TextStyle styleBoldTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: ConstantColor().darkbluedark,
  );

  TextStyle styleBoldDiscription = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: ConstantColor().grey4,
  );

  TextStyle styleTextButton = const TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 46, 113, 228),
    fontWeight: FontWeight.w700,
  );

  TextStyle styleTextGray = TextStyle(
    fontSize: 14,
    color: ConstantColor().grey2,
    fontWeight: FontWeight.w700,
  );
}
