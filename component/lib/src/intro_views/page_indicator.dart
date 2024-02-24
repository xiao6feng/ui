import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  PageIndicator({
    required this.itemCount,
    required this.currentIndex,
    this.normalColor,
    this.selectedColor,
    this.size = const Size(4, 4),
    this.spacing = 4,
  });

  final int itemCount;
  final int currentIndex;
  final Color? normalColor;
  final Color? selectedColor;
  final Size size;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }

  Widget _buildIndicator(
      int index, int pageCount, Size dotSize, double spacing) {
    bool isCurrentPageSelected = index == currentIndex;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing),
      child: Container(
        height: dotSize.height,
        width: dotSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dotSize.height / 2),
          color: isCurrentPageSelected ? selectedColor : normalColor,
        ),
      ),
    );
  }
}
