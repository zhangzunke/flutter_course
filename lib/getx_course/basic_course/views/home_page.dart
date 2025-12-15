import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/routes/app_routes.dart';
import 'package:flutter_course/getx_course/basic_course/views/detail_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/lang/lang_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/state_getx/get_builder_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/state_getx/obx_view.dart';
import 'package:flutter_course/getx_course/basic_course/views/state_getx/state_getx_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/state_getx/state_worker_page.dart';
import 'package:flutter_course/getx_course/basic_course/views/state_getx/value_builder_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView(
        children: [
          Divider(),
          Text('Navigator'),
          Divider(),
          ListTile(
            title: Text('Home -> List'),
            subtitle: Text('Get.toNamed("/home/list")'),
            onTap: () {
              Get.toNamed('/home/list');
            },
          ),
          ListTile(
            title: Text('Home -> List -> Detail'),
            subtitle: Text('Get.toNamed("/home/list/detail")'),
            onTap: () {
              Get.toNamed('/home/list/detail');
            },
          ),
          ListTile(
            title: Text('Home -> DetailPage()'),
            subtitle: Text('Get.to(DetailPage())'),
            onTap: () {
              Get.to(DetailPage());
            },
          ),
          ListTile(
            title: Text('Clear Last Page'),
            subtitle: Text('Get.offNamed("/home/list/detail")'),
            onTap: () {
              Get.offNamed('/home/list/detail');
            },
          ),
          ListTile(
            title: Text('Clear All Page'),
            subtitle: Text('Get.offAllNamed("/home/list/detail")'),
            onTap: () {
              Get.offAllNamed('/home/list/detail');
            },
          ),
          Divider(),
          Text('Navigator - Parameter'),
          Divider(),
          ListTile(
            title: Text('Parameter + Return'),
            subtitle: Text(
              "Get.toNamed('/home/list/detail', parameters: {'id': '123'})",
            ),
            onTap: () async {
              final result = await Get.toNamed(
                '/home/list/detail',
                parameters: {'id': '123'},
              );
              if (result != null) {
                Get.snackbar('Result', '${result["success"]}');
              }
            },
          ),
          ListTile(
            title: Text('Path + Return'),
            subtitle: Text("Get.toNamed('/home/list/detail?id=456')"),
            onTap: () async {
              final result = await Get.toNamed('/home/list/detail?id=456');
              if (result != null) {
                Get.snackbar('Result', '${result["success"]}');
              }
            },
          ),
          ListTile(
            title: Text('Route + Return'),
            subtitle: Text("Get.toNamed('/home/list/detail/789')"),
            onTap: () async {
              final result = await Get.toNamed('/home/list/detail/789');
              if (result != null) {
                Get.snackbar('Result', '${result["success"]}');
              }
            },
          ),
          Divider(),
          Text('Middlewares'),
          Divider(),
          ListTile(
            title: Text('Middlewares - Auth'),
            subtitle: Text('Get.toNamed(AppRoutes.me)'),
            onTap: () {
              Get.toNamed(AppRoutes.me);
            },
          ),
          Divider(),
          Text('Obx'),
          Divider(),
          ListTile(
            title: Text('Obx'),
            subtitle: Text('Get.to(ObxView())'),
            onTap: () {
              Get.to(ObxView());
            },
          ),
          ListTile(
            title: Text('Getx'),
            subtitle: Text('Get.to(StateGetxPage())'),
            onTap: () {
              Get.to(StateGetxPage());
            },
          ),
          ListTile(
            title: Text('GetBuilder'),
            subtitle: Text('Get.to(GetBuilderPage())'),
            onTap: () {
              Get.to(GetBuilderPage());
            },
          ),
          ListTile(
            title: Text('ValueBuilder'),
            subtitle: Text('Get.to(ValueBuilderPage())'),
            onTap: () {
              Get.to(ValueBuilderPage());
            },
          ),
          ListTile(
            title: Text('State Worker'),
            subtitle: Text('Get.to(StateWorkerPage())'),
            onTap: () {
              Get.to(StateWorkerPage());
            },
          ),
          Divider(),
          Text('Dependency'),
          Divider(),
          ListTile(
            title: Text('Dependency'),
            subtitle: Text('Get.toNamed(AppRoutes.dependency)'),
            onTap: () {
              Get.toNamed(AppRoutes.dependency);
            },
          ),
          ListTile(
            title: Text('Lazy Dependency'),
            subtitle: Text('Get.toNamed(AppRoutes.lazyDependency)'),
            onTap: () {
              Get.toNamed(AppRoutes.lazyDependency);
            },
          ),
          Divider(),
          Text('GetConnection'),
          Divider(),
          ListTile(
            title: Text(
              'Get Connection + Freezd + JsonSerializable + PageState',
            ),
            subtitle: Text('Get.toNamed(AppRoutes.user)'),
            onTap: () {
              Get.toNamed(AppRoutes.user);
            },
          ),
          ListTile(
            title: Text(
              'Get Connection + Freezd + JsonSerializable + StateMixin',
            ),
            subtitle: Text('Get.toNamed(AppRoutes.userMixin)'),
            onTap: () {
              Get.toNamed(AppRoutes.userMixin);
            },
          ),
          Divider(),
          Text('Lang'),
          Divider(),
          ListTile(
            title: Text('Lang'),
            subtitle: Text('Get.to(LangPage())'),
            onTap: () {
              Get.to(LangPage());
            },
          ),
        ],
      ),
    );
  }
}
