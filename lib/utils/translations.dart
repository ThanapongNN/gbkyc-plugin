import 'package:get/get.dart';

import 'lang/en-EN.dart';
import 'lang/th-TH.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_EN': en(), 'th_TH': th()};
}
