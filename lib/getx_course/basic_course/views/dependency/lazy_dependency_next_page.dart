import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/views/dependency/dependency_controller.dart';
import 'package:get/get.dart';

class LazyDependencyNextPage extends GetView<DependencyController> {
  const LazyDependencyNextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lazy Dependency')),
      body: Obx(
        () => Center(
          child: Column(children: [Text('Value -> ${controller.counter}')]),
        ),
      ),
    );
  }
}
