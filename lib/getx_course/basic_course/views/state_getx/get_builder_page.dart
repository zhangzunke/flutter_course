import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/views/state_getx/count_controller.dart';
import 'package:get/get.dart';

class GetBuilderPage extends StatelessWidget {
  const GetBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final countController = CountController();
    return Scaffold(
      appBar: AppBar(title: Text('Get Builder')),
      body: Center(
        child: Column(
          children: [
            GetBuilder<CountController>(
              init: countController,
              initState: (_) {},
              builder: (controller) {
                return Text('1. Count 1 - ${controller.count1}');
              },
            ),
            GetBuilder<CountController>(
              id: "id2",
              init: countController,
              initState: (_) {},
              builder: (controller) {
                return Text('2. Count 1 - ${controller.count1}');
              },
            ),
            GetBuilder<CountController>(
              init: countController,
              initState: (_) {},
              builder: (controller) {
                return Text('3. Count 1 - ${controller.count1}');
              },
            ),
            TextButton(
              onPressed: () {
                countController.addCount1();
              },
              child: Text('Add - No Text Change'),
            ),
            TextButton(
              onPressed: () {
                countController.update();
              },
              child: Text('Update - First and Last'),
            ),
            TextButton(
              onPressed: () {
                countController.update(['id2']);
              },
              child: Text('Update - Second Text'),
            ),
          ],
        ),
      ),
    );
  }
}
