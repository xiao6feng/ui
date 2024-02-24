import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

import 'page_indicator.dart';

typedef BuilderIndicator = Widget Function(int index);

class IntroView extends StatefulWidget {
  const IntroView({
    Key? key,
    required this.builder,
    this.pageController,
    required this.itemCount,
    this.normalColor,
    this.selectedColor,
    this.size,
    this.spacing,
    this.dotBottom = 30,
    this.builderIndicator,
    this.onPageChanged,
  }) : super(key: key);

  final NullableIndexedWidgetBuilder builder;
  final PageController? pageController;
  final int itemCount;
  final ValueChanged<int>? onPageChanged;

  final BuilderIndicator? builderIndicator;
  final Color? normalColor;
  final Color? selectedColor;
  final Size? size;
  final double? spacing;
  final double dotBottom;

  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  late PageController introPageController;
  int currentIndex = 0;

  @override
  void initState() {
    introPageController = widget.pageController ?? PageController();
    currentIndex = introPageController.initialPage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()?.introViewTheme;

    return Stack(
      children: [
        PageView.builder(
          itemBuilder: widget.builder,
          controller: widget.pageController,
          itemCount: widget.itemCount,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
            if (widget.onPageChanged != null) widget.onPageChanged!(value);
          },
        ),
        if (widget.builderIndicator != null)
          widget.builderIndicator!(currentIndex),
        if (widget.builderIndicator == null)
          Positioned(
              bottom: widget.dotBottom,
              left: 0,
              right: 0,
              child: PageIndicator(
                itemCount: widget.itemCount,
                currentIndex: currentIndex,
                normalColor:
                    widget.normalColor ?? theme?.normalColor ?? Colors.white,
                selectedColor: widget.normalColor ??
                    theme?.selectedColor ??
                    Color(0xffFF5722),
                size: widget.size ?? theme?.dotSize ?? const Size(10, 10),
                spacing: widget.spacing ?? theme?.spacing ?? 8,
              )),
      ],
    );
  }
}
