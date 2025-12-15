import 'package:flutter_course/getx_course/basic_course/models/user_model.dart';
import 'package:flutter_course/getx_course/basic_course/utils/state/page_state.dart';
import 'package:flutter_course/getx_course/basic_course/views/connection/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository repository;

  UserController({required this.repository});

  final state = const PageState<List<UserModel>>.loading().obs;

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  Future<void> loadUsers() async {
    state.value = const PageState.loading();
    try {
      final users = await repository.getUsers();
      state.value = PageState.success(users);
    } catch (e) {
      state.value = PageState.error(e.toString());
    }
  }
}
