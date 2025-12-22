import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/todo_list/app/core/utils/extensions.dart';
import 'package:flutter_course/getx_course/todo_list/app/core/values/colors.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AddDialog extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  AddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Form(
          key: homeController.formKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(3.0.wp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                        homeController.changeTask(null);
                        homeController.taskTitleController.clear();
                      },
                      icon: Icon(Icons.close),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () {
                        if (homeController.formKey.currentState!.validate()) {
                          final task = homeController.task.value;
                          if (task == null) {
                            EasyLoading.showError('Please select a task type');
                          } else {
                            final success = homeController.updateTask(
                              task,
                              homeController.taskTitleController.text,
                            );
                            if (success) {
                              EasyLoading.showSuccess(
                                'Todo item is added successfully',
                              );
                              Get.back();
                              homeController.changeTask(null);
                            } else {
                              EasyLoading.showError('Todo item already exists');
                            }
                            homeController.taskTitleController.clear();
                          }
                        }
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(fontSize: 14.0.sp, color: blue),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                child: Text(
                  'New Task',
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                child: TextFormField(
                  controller: homeController.taskTitleController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                  ),
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter task title';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 5.0.wp,
                  left: 5.0.wp,
                  right: 5.0.wp,
                  bottom: 2.0.wp,
                ),
                child: Text(
                  'Add to',
                  style: TextStyle(fontSize: 14.0.sp, color: Colors.grey),
                ),
              ),
              ...homeController.tasks.map(
                (e) => Obx(
                  () => InkWell(
                    onTap: () {
                      homeController.changeTask(e);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0.wp,
                        vertical: 2.0.wp,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                IconData(e.icon, fontFamily: 'MaterialIcons'),
                                color: HexColor.fromHex(e.color),
                              ),
                              SizedBox(width: 3.0.wp),
                              Text(
                                e.title,
                                style: TextStyle(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          if (homeController.task.value == e)
                            Icon(Icons.check, color: blue),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
