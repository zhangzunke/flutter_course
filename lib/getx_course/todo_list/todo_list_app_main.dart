import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/view.dart';
import 'package:get/get.dart';

class TodoListAppMain extends StatelessWidget {
  const TodoListAppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: 'Todo List App', home: HomePage());
  }
}
