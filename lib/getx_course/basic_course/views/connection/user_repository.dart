import 'package:flutter_course/getx_course/basic_course/models/user_model.dart';
import 'package:flutter_course/getx_course/basic_course/views/connection/user_provider.dart';

class UserRepository {
  final UserProvider provider;
  UserRepository({required this.provider});

  Future<List<UserModel>> getUsers() async {
    final response = await provider.getUsers();
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
