import 'package:flutter/material.dart';
import 'package:flutter_course/nested_navigation_getx/constants/nav_ids.dart';
import 'package:flutter_course/nested_navigation_getx/pages/profile/group_details_page.dart';
import 'package:flutter_course/nested_navigation_getx/pages/profile/profile_details_page.dart';
import 'package:flutter_course/nested_navigation_getx/pages/profile/profile_page.dart';
import 'package:get/get.dart';

class ProfileNav extends StatelessWidget {
  const ProfileNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.profile),
      onGenerateRoute: (settings) {
        if (settings.name == "/profile/details") {
          return GetPageRoute(
            settings: settings,
            page: () => ProfileDetailsPage(),
          );
        } else if (settings.name == "/profile/details/group") {
          return GetPageRoute(
            settings: settings,
            page: () => GroupDetailsPage(index: settings.arguments as int),
          );
        } else {
          return GetPageRoute(settings: settings, page: () => ProfilePage());
        }
      },
    );
  }
}
