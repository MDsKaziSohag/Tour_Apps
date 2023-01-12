import 'package:get/get.dart';
import 'package:my_application/Constines/Langages/bangl.dart';

import 'engl.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': eng,
    'bn_BD': ban,
  };
  
}