import 'package:flutter_course/getx_course/todo_list/app/data/models/task.dart';
import 'package:flutter_course/getx_course/todo_list/app/data/providers/task/provider.dart';

class TaskRepository {
  final TaskProvider _taskProvider;

  TaskRepository(this._taskProvider);

  void addTask(List<Task> tasks) => _taskProvider.saveTasks(tasks);

  List<Task> getTasks() => _taskProvider.getTasks();
}
