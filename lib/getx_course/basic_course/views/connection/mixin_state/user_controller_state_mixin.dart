import 'package:flutter_course/getx_course/basic_course/models/user_model.dart';
import 'package:flutter_course/getx_course/basic_course/views/connection/user_repository.dart';
import 'package:get/get.dart';

class UserControllerStateMixin extends GetxController
    with StateMixin<List<UserModel>> {
  final UserRepository repository;

  UserControllerStateMixin({required this.repository});

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  Future<void> loadUsers() async {
    change(null, status: RxStatus.loading());
    try {
      final users = await repository.getUsers();
      change(users, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
