import 'dart:convert';

import 'package:flutter_course/getx_course/todo_list/app/core/utils/keys.dart';
import 'package:flutter_course/getx_course/todo_list/app/data/models/task.dart';
import 'package:flutter_course/getx_course/todo_list/app/data/services/storage/service.dart';
import 'package:get/get.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

  List<Task> getTasks() {
    var tasks = <Task>[];
    final tasksJson = _storage.read(taskKey).toString();
    jsonDecode(tasksJson).forEach((json) {
      tasks.add(Task.fromJson(json));
    });
    return tasks;
  }

  void saveTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
