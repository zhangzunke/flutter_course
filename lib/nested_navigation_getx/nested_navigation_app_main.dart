import 'package:flutter/material.dart';
import 'package:flutter_course/nested_navigation_getx/base_screen.dart';
import 'package:get/get.dart';
import 'base_controller.dart';

class NestedNavigationAppMain extends StatelessWidget {
  NestedNavigationAppMain({super.key}) {
    Get.put<BaseController>(BaseController());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.indigo),
      home: const Banner(
        message: 'GET X',
        location: BannerLocation.topEnd,
        child: BaseScreen(),
      ),
    );
  }
}
