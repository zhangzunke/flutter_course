import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/todo_list/app/core/utils/extensions.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/controller.dart';
import 'package:get/get.dart';

class DoingList extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  DoingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          homeController.doingTodos.isEmpty && homeController.doneTodos.isEmpty
          ? Column(
              children: [
                SizedBox(height: 10.0.wp),
                Image.asset(
                  'assets/todo/task.png',
                  width: 65.0.wp,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.0.wp),
                Text(
                  'Add Task',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0.sp,
                  ),
                ),
              ],
            )
          : ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                ...homeController.doingTodos.map(
                  (todo) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0.wp,
                      vertical: 3.0.wp,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Checkbox(
                            value: todo['done'],
                            onChanged: (value) {
                              homeController.doneTodo(todo['title']);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                          child: Text(
                            todo['title'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (homeController.doingTodos.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                    child: Divider(thickness: 1.0),
                  ),
              ],
            ),
    );
  }
}
