import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObxView extends StatelessWidget {
  const ObxView({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = 0.obs;
    return Scaffold(
      appBar: AppBar(title: Text('Obx')),
      body: Center(
        child: Obx(
          () => Column(
            children: [
              Text('Count 1 - $counter'),
              Text('Count 2 - $counter'),
              TextButton(
                onPressed: () {
                  counter++;
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
