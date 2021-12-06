import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_test/controller.dart';

void main() {
  runApp(const GetMaterialApp(home: GridApp()));
  Get.put(AppController());
}

class GridApp extends StatelessWidget {
  const GridApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('HDD! HDD! HDD!')),
      body: const TestBody(),
    );
  }
}

class TestBody extends GetView<AppController> {
  const TestBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: const [
              TopButton('전체'),
              TopButton('TV/영상'),
              TopButton('냉장고'),
              TopButton('세탁기'),
              TopButton('생활가전'),
              TopButton('>')
            ],
          ),
        ),
        Expanded(
          flex: 20,
          child: Obx(() {
            return Stack(
              children: controller.bodies,
            );
          }),
        ),
      ],
    );
  }
}

class TopButton extends GetView<AppController> {
  final String title;

  const TopButton(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (title == '>') {
            controller.toggleGrid();
          }
        },
        child: Center(child: Text(title)),
      ),
    );
  }
}
