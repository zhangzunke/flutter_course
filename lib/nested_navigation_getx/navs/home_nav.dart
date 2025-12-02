import 'package:flutter/material.dart';
import 'package:flutter_course/nested_navigation_getx/constants/nav_ids.dart';
import 'package:flutter_course/nested_navigation_getx/pages/home/home_details_page.dart';
import 'package:flutter_course/nested_navigation_getx/pages/home/home_page.dart';
import 'package:get/get.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.home),
      onGenerateRoute: (settings) {
        if (settings.name == "/home/details") {
          return GetPageRoute(
            settings: settings,
            page: () => HomeDetailsPage(),
          );
        } else {
          return GetPageRoute(settings: settings, page: () => HomePage());
        }
      },
    );
  }
}
