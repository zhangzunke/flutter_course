import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/views/state_getx/count_controller.dart';
import 'package:get/get.dart';

class StateGetxPage extends StatelessWidget {
  StateGetxPage({super.key});
  final countController = CountController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GETX')),
      body: Center(
        child: Column(
          children: [
            GetX<CountController>(
              init: countController,
              initState: (_) {},
              builder: (controller) {
                debugPrint('Value 1');
                return Text('Value 1 - ${controller.count1}');
              },
            ),
            GetX<CountController>(
              init: countController,
              initState: (_) {},
              builder: (controller) {
                debugPrint('Value 2');
                return Text(
                  'Value 2 - ${controller.count1} - ${controller.count2}',
                );
              },
            ),
            GetX<CountController>(
              init: countController,
              initState: (_) {},
              builder: (controller) {
                debugPrint('Value 3');
                return Text('Value 3 - ${controller.count1}');
              },
            ),
            TextButton(
              onPressed: () {
                countController.addCount1();
              },
              child: Text('Add Value'),
            ),
            GetX<CountController>(
              init: countController,
              initState: (_) {},
              builder: (controller) {
                debugPrint('Value 4');
                return Text('Value 4 - ${controller.count2}');
              },
            ),
            TextButton(
              onPressed: () {
                countController.addCount1();
              },
              child: Text('Add Value'),
            ),
            TextButton(
              onPressed: () {
                countController.addCount2();
              },
              child: Text('Add Value'),
            ),
          ],
        ),
      ),
    );
  }
}
