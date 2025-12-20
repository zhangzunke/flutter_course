import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/todo_list/app/data/services/storage/service.dart';
import 'package:flutter_course/getx_course/todo_list/todo_list_app_main.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  // runApp(PetAppMain());
  // runApp(NestedNavigationAppMain());
  // runApp(DoctorAppoinmentAppMain());
  // runApp(BasicCourseAppMain());
  runTodoListAppMain();
}

void runTodoListAppMain() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(TodoListAppMain());
}
