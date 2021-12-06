import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: const Center(
        child: Text('This is Contnet'),
      ),
    );
  }
}

class AnimateOptions extends GetView<AppController> {
  const AnimateOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> titles = [
      '전체',
      'TV/영상',
      '냉장고',
      '세탁기',
      '생활가전',
      '주방가전',
      '계절가전',
      '이미용가전',
      '건강가전',
      '노트북',
      '데스크탑',
      '모니터',
    ];

    var gridItems = titles.map((title) => GridItem(title)).toList();

    return Obx(
      () => AnimatedContainer(
        height: controller.gridHeight.value,
        duration: const Duration(milliseconds: 500),
        child: GridOptions(gridItems),
      ),
    );
  }
}

class GridOptions extends StatelessWidget {
  final List<Widget> gridItems;

  const GridOptions(this.gridItems, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 16 / 9,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      shrinkWrap: false,
      children: gridItems,
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.red.shade50,
      ),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
