import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/utils/state/page_state.dart';
import 'package:flutter_course/getx_course/basic_course/views/connection/user_controller.dart';
import 'package:get/get.dart';

class UserPage extends GetView<UserController> {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: Obx(() {
        return controller.state.value.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (users) => ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
              );
            },
          ),
          error: (msg) => Center(child: Text(msg)),
        );
      }),
    );
  }
}
