import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/routes/app_routes.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    Future.delayed(
      Duration(seconds: 1),
      () => Get.snackbar('Message', 'You are not authed, go to login in page'),
    );
    return RouteSettings(name: AppRoutes.login);
  }
}
