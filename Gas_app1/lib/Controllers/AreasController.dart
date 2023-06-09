import 'package:flutter/material.dart';
import 'package:gas_app/model/iteam.dart';
import 'package:get/get.dart';

class AreasController extends GetxController {
  final nameController = TextEditingController();

  var areas = <Area>[].obs;

  void addArea() {
    final name = nameController.text.trim();
    if (name.isNotEmpty) {
      areas.add(Area(name: name, blocks: []));
      nameController.clear();
    }
  }

  void deleteArea(Area area) {
    areas.remove(area);
  }
}


class BlocksController extends GetxController {
  final nameController = TextEditingController();

  var blocks = <Block>[].obs;

  void addBlock() {
    final name = nameController.text.trim();
    if (name.isNotEmpty) {
      blocks.add(Block(name: name, color: ''));
      nameController.clear();
    }
  }

  void deleteBlock(Block block) {
    blocks.remove(block);
  }
}