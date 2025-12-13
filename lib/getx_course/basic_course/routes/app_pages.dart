import 'package:flutter_course/getx_course/basic_course/middlewares/auth_middleware.dart';
import 'package:flutter_course/getx_course/basic_course/routes/app_routes.dart';
import 'package:flutter_course/getx_course/basic_course/views/dependency/dependency_bind.dart';
import 'package:flutter_course/getx_course/basic_course/views/dependency/dependency_next_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/dependency/dependency_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/dependency/lazy_dependency_next_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/dependency/lazy_dependency_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/detail_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/home_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/list_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/login_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/me_page.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoutes.home;
  static final routes = [
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(
      name: AppRoutes.me,
      page: () => MePage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      children: [
        GetPage(
          name: AppRoutes.list,
          page: () => ListPage(),
          children: [
            GetPage(name: AppRoutes.detail, page: () => DetailPage()),
            GetPage(name: AppRoutes.detailId, page: () => DetailPage()),
          ],
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.dependency,
      page: () => DependencyPage(),
      children: [
        GetPage(
          name: AppRoutes.dependencyNext,
          page: () => DependencyNextPage(),
        ),
      ],
    ),
    GetPage(
      name: AppRoutes.lazyDependency,
      page: () => LazyDependencyPage(),
      binding: DependencyBind(),
      children: [
        GetPage(
          name: AppRoutes.lazyDependencyNext,
          page: () => LazyDependencyNextPage(),
        ),
      ],
    ),
  ];
}
