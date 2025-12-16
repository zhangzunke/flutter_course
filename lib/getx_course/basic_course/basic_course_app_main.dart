import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/routes/app_pages.dart';
import 'package:flutter_course/getx_course/basic_course/views/lang/translation_service.dart';
import 'package:get/get.dart';

class BasicCourseAppMain extends StatelessWidget {
  const BasicCourseAppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocal,
      translations: TranslationService(),
      routingCallback: (Routing? routing) {
        debugPrint(
          'from: ${routing?.previous} -> to: ${routing?.current}, back: ${routing?.isBack}',
        );
      },
    );
  }
}
