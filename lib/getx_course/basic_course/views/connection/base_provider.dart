import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    baseUrl = 'https://dummyjson.com';
    httpClient.addRequestModifier<void>((request) {
      debugPrint('Add Token');
      request.headers['token'] = '123456';
      return request;
    });
    httpClient.addResponseModifier((request, reponse) {
      debugPrint('Add Response');
      return reponse;
    });
    super.onInit();
  }
}
