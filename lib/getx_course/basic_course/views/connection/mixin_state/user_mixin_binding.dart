import 'package:flutter_course/getx_course/basic_course/views/connection/mixin_state/user_controller_state_mixin.dart';
import 'package:flutter_course/getx_course/basic_course/views/connection/user_provider.dart';
import 'package:flutter_course/getx_course/basic_course/views/connection/user_repository.dart';
import 'package:get/get.dart';

class UserMixinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProvider());
    Get.lazyPut(() => UserRepository(provider: Get.find()));
    Get.lazyPut(() => UserControllerStateMixin(repository: Get.find()));
  }
}
