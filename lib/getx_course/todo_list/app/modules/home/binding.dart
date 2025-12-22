import 'package:flutter_course/getx_course/todo_list/app/data/providers/task/provider.dart';
import 'package:flutter_course/getx_course/todo_list/app/data/services/storage/repository.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskProvider>(() => TaskProvider());
    Get.lazyPut<TaskRepository>(() => TaskRepository(Get.find<TaskProvider>()));
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<TaskRepository>()),
    );
  }
}
