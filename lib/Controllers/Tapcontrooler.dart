import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this,initialIndex: 1);
  }

  
}