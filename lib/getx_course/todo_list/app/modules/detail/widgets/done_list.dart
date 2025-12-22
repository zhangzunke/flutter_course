import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/todo_list/app/core/utils/extensions.dart';
import 'package:flutter_course/getx_course/todo_list/app/core/values/colors.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/controller.dart';
import 'package:get/get.dart';

class DoneList extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  DoneList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeController.doneTodos.isNotEmpty
          ? ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 5.0.wp,
                    vertical: 2.0.wp,
                  ),
                  child: Text(
                    'Completed (${homeController.doneTodos.length})',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ...homeController.doneTodos.map(
                  (todo) => Dismissible(
                    key: ObjectKey(todo),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) =>
                        homeController.deleteTodo(todo['title']),
                    background: Container(
                      padding: EdgeInsets.only(right: 5.0.wp),
                      alignment: Alignment.centerRight,
                      color: Colors.red.withAlpha(204),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0.wp,
                        vertical: 3.0.wp,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Icon(Icons.done, color: blue),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                            child: Text(
                              todo['title'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
