import 'package:flutter/material.dart';
import 'package:flutter_course/nested_navigation_getx/constants/nav_ids.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed("/profile/details", id: NavIds.profile);
          },
          child: Text('Go to Profile Details'),
        ),
      ),
    );
  }
}
