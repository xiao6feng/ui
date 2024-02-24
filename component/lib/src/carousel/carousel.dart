import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide Banner;

/// 走马灯
class Carousel extends StatefulWidget {
  /// 走马灯
  const Carousel({
    required this.aspectRatio,
    super.key,
    this.itemCount = 0,
    this.autoPlay = true,
    this.loop = true,
    this.viewportFraction = 1,
    this.itemBuilder,
    this.indicatorDecoration,
  });

  /// 走马灯数量
  final int itemCount;

  /// 是否自动切换
  final bool autoPlay;

  /// 是否循环
  final bool loop;

  /// 走马灯内容构造器
  final IndexedWidgetBuilder? itemBuilder;

  ///  走马灯item占据viewport比例 [0-1] 之间取值
  final double viewportFraction;

  /// 比例
  final double aspectRatio;

  /// 指示器
  final IndicatorDecoration? indicatorDecoration;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  late final int itemCount;
  late final IndexedWidgetBuilder itemBuilder;
  late final Widget children;

  late final IndicatorDecoration indicatorDecoration;

  @override
  void initState() {
    itemCount = widget.itemCount;
    itemBuilder = widget.itemBuilder ??
            (context, index) => Container(
          color: const Color.fromARGB(102, 255, 255, 255),
        );

    indicatorDecoration = widget.indicatorDecoration ?? IndicatorDecoration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: CarouselSlider(
              items: [
                for (var i = 0; i < itemCount; i++) itemBuilder(context, i)
              ],
              carouselController: _controller,
              options: CarouselOptions(
                autoPlay: widget.autoPlay,
                enableInfiniteScroll: widget.loop,
                viewportFraction: 1,
                aspectRatio: widget.aspectRatio,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: indicatorDecoration.top,
            left: indicatorDecoration.left,
            bottom: indicatorDecoration.bottom,
            right: indicatorDecoration.right,
            child: _buildIndicator(itemCount),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(int itemCount) {
    final items = <Widget>[];
    for (var i = 0; i < itemCount; i++) {
      final Widget dot = Container(
        width: indicatorDecoration.width,
        height: indicatorDecoration.height,
        margin: EdgeInsets.symmetric(horizontal: indicatorDecoration.space),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(indicatorDecoration.height / 2),
          color: _current == i
              ? indicatorDecoration.activeColor
              : indicatorDecoration.color,
        ),
      );
      items.add(dot);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: items,
    );
  }
}

class IndicatorDecoration {
  ///
  final Color? activeColor;

  ///,if set null , will be Theme.of(context).scaffoldBackgroundColor
  final Color? color;

  ///width of the dot
  final double width;

  ///height of the dot
  final double height;

  /// Space between dots
  final double space;

  /// position
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;

  IndicatorDecoration({
    this.top,
    this.left,
    this.bottom = 14,
    this.right,
    this.activeColor = const Color(0xFFFF5722),
    this.color = const Color(0x33FEFFFE),
    this.width = 12,
    this.height = 3,
    this.space = 3,
  });
}
