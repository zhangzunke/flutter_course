import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/binding.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class TodoListAppMain extends StatelessWidget {
  const TodoListAppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo List App',
      home: HomePage(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}
