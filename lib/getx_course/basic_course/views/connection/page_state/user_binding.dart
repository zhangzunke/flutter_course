import 'package:flutter_course/getx_course/basic_course/views/connection/page_state/user_controller.dart';
import 'package:flutter_course/getx_course/basic_course/views/connection/user_provider.dart';
import 'package:flutter_course/getx_course/basic_course/views/connection/user_repository.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProvider());
    Get.lazyPut(() => UserRepository(provider: Get.find()));
    Get.lazyPut(() => UserController(repository: Get.find()));
  }
}
