import 'package:flutter/material.dart';

class CarouselSliderIndicator extends StatelessWidget {
  const CarouselSliderIndicator({
    super.key,
    required this.images,
    required this.currentPage,
  });

  final List<String> images;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: images.map((path) {
        int index = images.indexOf(path);
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Colors.blue : Colors.grey,
          ),
        );
      }).toList(),
    );
  }
}