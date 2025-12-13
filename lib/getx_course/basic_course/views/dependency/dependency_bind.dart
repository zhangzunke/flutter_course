import 'package:flutter_course/getx_course/basic_course/views/dependency/dependency_controller.dart';
import 'package:get/get.dart';

class DependencyBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DependencyController());
  }
}
