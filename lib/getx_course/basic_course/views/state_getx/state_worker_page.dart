import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/views/state_getx/state_worker_controller.dart';
import 'package:get/get.dart';

class StateWorkerPage extends StatelessWidget {
  StateWorkerPage({super.key});

  final controller = StateWorkerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('State Worker')),
      body: Center(
        child: Column(
          children: [
            GetX<StateWorkerController>(
              init: controller,
              initState: (_) {},
              builder: (c) {
                return Text('Value ${c.counter}');
              },
            ),
            TextButton(
              onPressed: () {
                controller.add();
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
