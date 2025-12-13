import 'package:get/get.dart';

class DependencyController extends GetxController {
  final _counter = 0.obs;
  int get counter => _counter.value;
  set counter(value) => _counter.value = value;

  add() => counter++;
}
