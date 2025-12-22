import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/todo_list/app/data/models/task.dart';
import 'package:flutter_course/getx_course/todo_list/app/data/services/storage/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TaskRepository _taskRepository;
  HomeController(this._taskRepository);

  final tasks = <Task>[].obs;
  final formKey = GlobalKey<FormState>();
  final taskTitleController = TextEditingController();
  final chipIndex = 0.obs;
  final deleting = false.obs;
  final task = Rx<Task?>(null);

  final doingTodos = <dynamic>[].obs;
  final doneTodos = <dynamic>[].obs;

  final tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(_taskRepository.getTasks());
    ever(tasks, (tasks) => _taskRepository.addTask(tasks));
  }

  @override
  void onClose() {
    taskTitleController.dispose();
    super.onClose();
  }

  void changeChipIndex(int index) {
    chipIndex.value = index;
  }

  void changeDeleting(bool value) {
    deleting.value = value;
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }

  void changeTask(Task? value) {
    task.value = value;
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }

  bool updateTask(Task task, String title) {
    var todos = task.todos ?? [];
    if (containeTodo(todos, title)) {
      return false;
    }
    var todo = {'title': title, 'done': false};
    todos.add(todo);
    var newTask = task.copyWith(todos: todos);
    var index = tasks.indexOf(task);
    tasks[index] = newTask;
    return true;
  }

  bool containeTodo(List todos, String title) {
    return todos.any((todo) => todo['title'] == title);
  }

  void changeTodos(List<dynamic> todos) {
    doingTodos.clear();
    doneTodos.clear();
    for (var todo in todos) {
      if (todo['done'] == true) {
        doneTodos.add(todo);
      } else {
        doingTodos.add(todo);
      }
    }
  }

  bool addTodo(Task task, String title) {
    var todo = {'title': title, 'done': false};
    if (doingTodos.any((t) => mapEquals(t, todo))) {
      return false;
    }
    var doneTodo = {'title': title, 'done': true};
    if (doneTodos.any((t) => mapEquals(t, doneTodo))) {
      return false;
    }
    doingTodos.add(todo);
    return true;
  }

  void updateTodos(Task task) {
    var todos = [...doingTodos, ...doneTodos];
    var newTask = task.copyWith(todos: todos);
    var index = tasks.indexOf(task);
    tasks[index] = newTask;
  }

  void doneTodo(String title) {
    var index = doingTodos.indexWhere(
      (todo) => todo['title'].toString() == title,
    );
    if (index != -1) {
      var todo = doingTodos.removeAt(index);
      todo['done'] = true;
      doneTodos.add(todo);
    }
  }

  void deleteTodo(String title) {
    var index = doneTodos.indexWhere(
      (todo) => todo['title'].toString() == title,
    );
    if (index != -1) {
      doneTodos.removeAt(index);
    }
  }

  bool isTodosEmpty(Task task) {
    return task.todos == null || task.todos!.isEmpty;
  }

  int getDoneTodosLength(Task task) {
    if (task.todos == null) {
      return 0;
    }
    return task.todos!.where((todo) => todo['done'] == true).length;
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  int getTotalTask() {
    var total = 0;
    for (var task in tasks) {
      if (task.todos != null) {
        total += task.todos!.length;
      }
    }
    return total;
  }

  int getTotalDoneTodos() {
    var total = 0;
    for (var task in tasks) {
      if (task.todos != null) {
        total += task.todos!
            .where((todo) => todo['done'] == true)
            .toList()
            .length;
      }
    }
    return total;
  }
}
