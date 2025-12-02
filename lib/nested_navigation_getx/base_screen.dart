import 'package:flutter/material.dart';
import 'package:flutter_course/nested_navigation_getx/base_controller.dart';
import 'package:flutter_course/nested_navigation_getx/bottom_navigation_bar.dart';
import 'package:flutter_course/nested_navigation_getx/navs/home_nav.dart';
import 'package:flutter_course/nested_navigation_getx/navs/profile_nav.dart';
import 'package:get/get.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: BaseController.to.currentIndex.value,
          children: [HomeNav(), ProfileNav()],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
