import 'package:get/get.dart';

class StateWorkerController extends GetxController {
  final _counter = 0.obs;
  int get counter => _counter.value;
  set counter(value) => _counter.value = value;

  @override
  void onInit() {
    ever(_counter, (value) {
      print('Ever $value');
    });
    once(_counter, (value) {
      print('Once $value');
    });
    debounce(
      _counter,
      (value) => {print('Debounce $value')},
      time: Duration(seconds: 2),
    );
    interval(_counter, (value) {
      print('Interval $value');
    }, time: Duration(seconds: 1));
    super.onInit();
  }

  add() {
    counter++;
  }
}
