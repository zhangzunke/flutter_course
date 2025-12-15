import 'package:flutter/painting.dart';
import 'package:flutter_course/getx_course/basic_course/views/lang/en_US.dart';
import 'package:flutter_course/getx_course/basic_course/views/lang/zh_hans.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocal = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en_US,
    'zh_Hans': zh_Hans,
  };
}
