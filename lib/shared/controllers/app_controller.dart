import 'package:get/get.dart';

class AppController extends GetxController {
  final devType = 'mobile'.obs;
  final screenWidth = 0.0.obs;
  final screenHeight = 0.0.obs;

  void updateScreenSize(double width, double height) {
    screenWidth.value = width;
    screenHeight.value = height;
    if (screenWidth < 650) {
      devType.value = 'Mobile';
    } else if (screenWidth < 950) {
      devType.value = 'Tablet';
    } else {
      devType.value = 'Desktop';
    }
  }
}
