import 'package:get/get.dart';

class CountController extends GetxController {
  final _count1 = 0.obs;
  int get count1 => _count1.value;
  set count1(value) => _count1.value++;

  final _count2 = 0.obs;
  int get count2 => _count2.value;
  set count2(value) => _count2.value++;

  void addCount1() => count1++;
  void addCount2() => count2++;
}
