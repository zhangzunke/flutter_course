import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/routes/app_routes.dart';
import 'package:flutter_course/getx_course/basic_course/views/dependency/dependency_controller.dart';
import 'package:get/get.dart';

class DependencyPage extends StatelessWidget {
  const DependencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DependencyController controller = Get.put<DependencyController>(
      DependencyController(),
    );
    return Scaffold(
      appBar: AppBar(title: Text('Dependency')),
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
                  '${AppRoutes.dependency}${AppRoutes.dependencyNext}',
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
