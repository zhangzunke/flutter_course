import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    baseUrl = 'https://dummyjson.com';
    httpClient.addRequestModifier<void>((request) {
      print('Add Token');
      request.headers['token'] = '123456';
      return request;
    });
    httpClient.addResponseModifier((request, reponse) {
      print('Add Response');
      return reponse;
    });
    super.onInit();
  }
}
