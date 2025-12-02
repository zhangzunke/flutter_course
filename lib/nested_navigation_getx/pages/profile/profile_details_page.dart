import 'package:flutter/material.dart';
import 'package:flutter_course/nested_navigation_getx/constants/nav_ids.dart';
import 'package:get/get.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Details')),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 4),
              child: Card(
                child: SizedBox(
                  height: 90,
                  child: ListTile(
                    onTap: () {
                      Get.toNamed(
                        "/profile/details/group",
                        id: NavIds.profile,
                        arguments: index,
                      );
                    },
                    leading: Icon(Icons.group),
                    title: Text('GROUP NUMBER'),
                    trailing: Text(index.toString()),
                    subtitle: Text(
                      'In publishing and graphic design, Lorem ipsum is a placeholder text commonly...',
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
