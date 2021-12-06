import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_test/widgets/home_widget.dart';

class AppController extends GetxController {
  RxList<Widget> bodies = <Widget>[const HomeWidget(), const AnimateOptions()].obs;
  RxDouble gridHeight = 0.0.obs;

  bool isOpen = false;

  void toggleGrid () {
    if (!isOpen) {
      gridHeight.value = 300;
    } else {
      gridHeight.value = 1;
    }

    isOpen = !isOpen;
  }
}