import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/todo_list/app/core/utils/extensions.dart';
import 'package:flutter_course/getx_course/todo_list/app/core/values/colors.dart';
import 'package:flutter_course/getx_course/todo_list/app/data/models/task.dart';
import 'package:flutter_course/getx_course/todo_list/app/modules/home/controller.dart';
import 'package:flutter_course/getx_course/todo_list/app/widgets/icons.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AddCard extends StatelessWidget {
  AddCard({super.key});
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      height: squareWidth / 2,
      width: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            title: 'Task Type',
            radius: 5.0,
            content: Form(
              key: homeController.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                    child: TextFormField(
                      controller: homeController.taskTitleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Title',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter task title';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.wp),
                    child: Wrap(
                      spacing: 2.0.wp,
                      children: icons
                          .map(
                            (icon) => Obx(() {
                              final index = icons.indexOf(icon);
                              return ChoiceChip(
                                showCheckmark: false,
                                label: icon,
                                selectedColor: Colors.grey[200],
                                pressElevation: 0,
                                backgroundColor: Colors.white,
                                selected:
                                    homeController.chipIndex.value == index,
                                onSelected: (selected) {
                                  if (selected) {
                                    homeController.changeChipIndex(index);
                                  }
                                },
                              );
                            }),
                          )
                          .toList(),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(150, 40),
                    ),
                    onPressed: () {
                      if (homeController.formKey.currentState!.validate()) {
                        var title = homeController.taskTitleController.text;
                        var icon = icons[homeController.chipIndex.value];
                        final task = Task(
                          title: title,
                          icon: icon.icon!.codePoint,
                          color: icon.color!.toHex(),
                        );
                        Get.back();
                        homeController.addTask(task)
                            ? EasyLoading.showSuccess('Task Added')
                            : EasyLoading.showError('Task already exists');
                      }
                    },
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ),
          );
          homeController.taskTitleController.clear();
          homeController.changeChipIndex(0);
        },
        child: DottedBorder(
          options: RectDottedBorderOptions(
            color: Colors.grey[400]!,
            dashPattern: const [8, 4],
          ),
          child: Center(
            child: Icon(Icons.add, size: 10.0.wp, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
