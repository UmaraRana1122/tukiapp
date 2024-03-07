import 'package:get/get.dart';

class PageTransition {
  static pageNavigation({required page}) {
    Get.to(page,
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 100));
  }

  static pageBackNavigation({required page}) {
    Get.off(page,
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 100));
  }

  static pageProperNavigation({required page}) {
    Get.offAll(page,
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 100));
  }
}
