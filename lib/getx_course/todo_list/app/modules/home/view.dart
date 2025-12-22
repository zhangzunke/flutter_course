import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/todo_list/app/core/values/colors.dart';
import 'package:flutter_course/getx_course/todo_list/app/data/models/task.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/controller.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/widgets/add_card.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/widgets/add_dialog.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/widgets/task_card.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/report/view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_course/getx_course/todo_list/app/core/utils/extensions.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(4.0.wp),
                    child: Text(
                      'My List',
                      style: TextStyle(
                        fontSize: 24.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      ...controller.tasks.map(
                        (task) => LongPressDraggable(
                          data: task,
                          onDragStarted: () => controller.changeDeleting(true),
                          onDraggableCanceled: (_, __) =>
                              controller.changeDeleting(false),
                          onDragEnd: (_) => controller.changeDeleting(false),
                          feedback: Opacity(
                            opacity: 0.8,
                            child: TaskCard(task: task),
                          ),
                          child: TaskCard(task: task),
                        ),
                      ),
                      AddCard(),
                    ],
                  ),
                ],
              ),
            ),
            ReportPage(),
          ],
        ),
      ),
      floatingActionButton: DragTarget<Task>(
        onAcceptWithDetails: (details) {
          controller.deleteTask(details.data);
          EasyLoading.showSuccess('Task Deleted');
        },
        builder: (_, __, ___) {
          return Obx(
            () => FloatingActionButton(
              shape: CircleBorder(),
              foregroundColor: Colors.white,
              backgroundColor: controller.deleting.value ? Colors.red : blue,
              onPressed: () {
                Get.to(() => AddDialog(), transition: Transition.downToUp);
              },
              child: Icon(controller.deleting.value ? Icons.delete : Icons.add),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            controller.changeTabIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(right: 15.0.wp),
                child: Icon(Icons.apps),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(left: 15.0.wp),
                child: Icon(Icons.data_usage),
              ),
              label: 'Report',
            ),
          ],
        ),
      ),
    );
  }
}
