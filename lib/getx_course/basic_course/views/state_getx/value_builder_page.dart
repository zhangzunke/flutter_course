import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/simple_builder.dart';

class ValueBuilderPage extends StatelessWidget {
  const ValueBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Value Build')),
      body: Center(
        child: ValueBuilder<int?>(
          initialValue: 0,
          builder: (int? value, updateFun) {
            final int current = value ?? 0;
            return Column(
              children: [
                Text('Value - $value'),
                TextButton(
                  onPressed: () {
                    updateFun(current + 1);
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
          onDispose: () => print('Dispose'),
          onUpdate: (count) => print('Update Value $count'),
        ),
      ),
    );
  }
}
