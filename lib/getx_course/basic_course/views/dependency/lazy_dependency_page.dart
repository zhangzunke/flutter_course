import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/routes/app_pages.dart';
import 'package:flutter_course/getx_course/basic_course/routes/app_routes.dart';
import 'package:flutter_course/getx_course/basic_course/views/dependency/dependency_controller.dart';
import 'package:get/get.dart';

class LazyDependencyPage extends StatelessWidget {
  const LazyDependencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DependencyController controller = Get.find<DependencyController>();
    return Scaffold(
      appBar: AppBar(title: Text('Lazy Dependency')),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text('Value -> ${controller.counter}')),
            TextButton(
              onPressed: () {
                controller.add();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(
                  '${AppRoutes.lazyDependency}${AppRoutes.lazyDependencyNext}',
                );
              },
              child: Text('Go to Next'),
            ),
          ],
        ),
      ),
    );
  }
}
