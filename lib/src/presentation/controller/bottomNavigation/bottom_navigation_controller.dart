import 'package:get/get.dart';

import '../../../core/routes/routes.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs; // Observable variable for the current index
  // Update the index
  void updateIndex(int index) {
    print("index ${index}");
    currentIndex.value = index;

  }
}