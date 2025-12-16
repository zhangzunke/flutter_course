import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateWorkerController extends GetxController {
  final _counter = 0.obs;
  int get counter => _counter.value;
  set counter(value) => _counter.value = value;

  @override
  void onInit() {
    ever(_counter, (value) {
      debugPrint('Ever $value');
    });
    once(_counter, (value) {
      debugPrint('Once $value');
    });
    debounce(
      _counter,
      (value) => {debugPrint('Debounce $value')},
      time: Duration(seconds: 2),
    );
    interval(_counter, (value) {
      debugPrint('Interval $value');
    }, time: Duration(seconds: 1));
    super.onInit();
  }

  add() {
    counter++;
  }
}
