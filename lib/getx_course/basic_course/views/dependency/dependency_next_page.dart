import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/views/dependency/dependency_controller.dart';
import 'package:get/get.dart';

class DependencyNextPage extends StatelessWidget {
  const DependencyNextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DependencyController>();
    return Scaffold(
      appBar: AppBar(title: Text('Dependency')),
      body: Obx(
        () => Center(
          child: Column(children: [Text('Value -> ${controller.counter}')]),
        ),
      ),
    );
  }
}
