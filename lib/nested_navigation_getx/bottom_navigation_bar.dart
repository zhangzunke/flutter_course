import 'package:flutter/material.dart';
import 'package:flutter_course/nested_navigation_getx/base_controller.dart';
import 'package:get/state_manager.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        indicatorColor: Theme.of(context).primaryColor,
        elevation: 10,
        selectedIndex: BaseController.to.currentIndex.value,
        onDestinationSelected: (value) => BaseController.to.changeIndex(value),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2_outlined),
            selectedIcon: Icon(Icons.person_2, color: Colors.white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
