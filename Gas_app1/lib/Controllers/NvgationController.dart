import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 2.obs;
  void changePage(int index) {
    selectedIndex.value = index;
    update();
  }
}