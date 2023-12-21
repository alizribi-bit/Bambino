import 'package:bambino/Setting/lang/AR.dart';
import 'package:bambino/Setting/lang/FR.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'fr': fr,
        'ar': ar,
      };
}
