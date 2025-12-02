import 'package:get/get.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();
  var currentIndex = 0.obs;

  void changeIndex(int newIndex) {
    /* Always return the first page
    if (currentIndex.value != newIndex) {
      Get.nestedKey(
        currentIndex,
      )?.currentState?.popUntil((route) => route.isFirst);
      currentIndex.value = newIndex;
    }
    */
    //
    if (currentIndex.value == newIndex) {
      Get.nestedKey(
        currentIndex,
      )?.currentState?.popUntil((route) => route.isFirst);
    } else {
      currentIndex.value = newIndex;
    }
  }
}
