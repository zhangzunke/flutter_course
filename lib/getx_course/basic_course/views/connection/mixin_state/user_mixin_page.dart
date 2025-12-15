import 'package:flutter/material.dart';
import 'package:flutter_course/getx_course/basic_course/views/connection/mixin_state/user_controller_state_mixin.dart';
import 'package:get/get.dart';

class UserMixinPage extends GetView<UserControllerStateMixin> {
  const UserMixinPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users with Mixin')),
      body: controller.obx(
        (users) {
          return ListView.builder(
            itemCount: users!.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
              );
            },
          );
        },
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Text(error!),
      ),
    );
  }
}
