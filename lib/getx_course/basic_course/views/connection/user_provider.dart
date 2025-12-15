import 'package:flutter_course/getx_course/basic_course/views/connection/base_provider.dart';
import 'package:flutter_course/getx_course/basic_course/models/user_model.dart';
import 'package:get/get_connect.dart';

class UserProvider extends BaseProvider {
  Future<Response<List<UserModel>>> getUsers() async {
    final response = await get('/users');
    final users = (response.body['users'] as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
    return Response(
      statusCode: response.statusCode,
      statusText: response.statusText,
      body: users,
    );
  }
}
