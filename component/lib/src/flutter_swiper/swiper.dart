// ignore_for_file: public_member_api_docs
// ignore_for_file: always_use_package_imports
// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';

import 'package:flutter/material.dart';

import 'flutter_page_indicator/flutter_page_indicator.dart';
import 'swiper_controller.dart';
import 'swiper_pagination.dart';
import 'swiper_plugin.dart';
import 'transformer_page_view/index_controller.dart';
import 'transformer_page_view/transformer_page_view.dart';

part 'custom_layout.dart';

typedef SwiperOnTap = void Function(int index);

typedef SwiperDataBuilder = Widget Function(
  BuildContext context,
  dynamic data,
  int index,
);

/// default auto play delay
const int kDefaultAutoplayDelayMs = 3000;

///  Default auto play transition duration (in millisecond)
const int kDefaultAutoplayTransactionDuration = 300;

const int kMaxValue = 2000000000;
const int kMiddleValue = 1000000000;

enum SwiperLayout { DEFAULT, STACK, TINDER, CUSTOM }

class Swiper extends StatefulWidget {
  const Swiper({
    required this.itemBuilder,
    required this.itemCount,
    this.indicatorLayout = PageIndicatorLayout.NONE,

    ///
    this.transformer,
    this.autoplay = false,
    this.layout = SwiperLayout.DEFAULT,
    this.autoplayDelay = kDefaultAutoplayDelayMs,
    this.autoplayDisableOnInteraction = true,
    this.duration = kDefaultAutoplayTransactionDuration,
    this.onIndexChanged,
    this.index,
    this.onTap,
    this.control,
    this.loop = true,
    this.curve = Curves.ease,
    this.scrollDirection = Axis.horizontal,
    this.pagination,
    this.plugins,
    this.physics,
    super.key,
    this.controller,
    this.customLayoutOption,

    /// since v1.0.0
    this.containerHeight,
    this.containerWidth,
    this.viewportFraction = 1.0,
    this.itemHeight = double.infinity,
    this.itemWidth = double.infinity,
    this.outer = false,
    this.scale,
    this.fade,
  }) : assert(
          !loop ||
              ((loop &&
                      layout == SwiperLayout.DEFAULT &&
                      (indicatorLayout == PageIndicatorLayout.SCALE ||
                          indicatorLayout == PageIndicatorLayout.COLOR ||
                          indicatorLayout == PageIndicatorLayout.NONE)) ||
                  (loop && layout != SwiperLayout.DEFAULT)),
          'Only support `PageIndicatorLayout.SCALE` and `PageIndicatorLayout.COLOR`when layout==SwiperLayout.DEFAULT in loop mode',
        );

  factory Swiper.children({
    required List<Widget> children,
    bool autoplay = false,
    PageTransformer? transformer,
    int autoplayDelay = kDefaultAutoplayDelayMs,
    bool reverse = false,
    bool autoplayDisableOnInteraction = true,
    int duration = kDefaultAutoplayTransactionDuration,
    ValueChanged<int>? onIndexChanged,
    int index = 0,
    SwiperOnTap? onTap,
    bool loop = true,
    Curve curve = Curves.ease,
    Axis scrollDirection = Axis.horizontal,
    SwiperPlugin? pagination,
    SwiperPlugin? control,
    List<SwiperPlugin>? plugins,
    SwiperController? controller,
    Key? key,
    CustomLayoutOption? customLayoutOption,
    ScrollPhysics? physics,
    double? containerHeight,
    double? containerWidth,
    double viewportFraction = 1.0,
    double itemHeight = double.infinity,
    double itemWidth = double.infinity,
    bool outer = false,
    double scale = 1.0,
  }) {
    return Swiper(
      transformer: transformer,
      customLayoutOption: customLayoutOption,
      containerHeight: containerHeight,
      containerWidth: containerWidth,
      viewportFraction: viewportFraction,
      itemHeight: itemHeight,
      itemWidth: itemWidth,
      outer: outer,
      scale: scale,
      autoplay: autoplay,
      autoplayDelay: autoplayDelay,
      autoplayDisableOnInteraction: autoplayDisableOnInteraction,
      duration: duration,
      onIndexChanged: onIndexChanged,
      index: index,
      onTap: onTap,
      curve: curve,
      scrollDirection: scrollDirection,
      pagination: pagination,
      control: control,
      controller: controller,
      loop: loop,
      plugins: plugins,
      physics: physics,
      key: key,
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
      itemCount: children.length,
    );
  }

  factory Swiper.list({
    required List list,
    required SwiperDataBuilder builder,
    PageTransformer? transformer,
    CustomLayoutOption? customLayoutOption,
    bool autoplay = false,
    int autoplayDelay = kDefaultAutoplayDelayMs,
    bool reverse = false,
    bool autoplayDisableOnInteraction = true,
    int duration = kDefaultAutoplayTransactionDuration,
    ValueChanged<int>? onIndexChanged,
    int index = 0,
    SwiperOnTap? onTap,
    bool loop = true,
    Curve curve = Curves.ease,
    Axis scrollDirection = Axis.horizontal,
    SwiperPlugin? pagination,
    SwiperPlugin? control,
    List<SwiperPlugin>? plugins,
    SwiperController? controller,
    Key? key,
    ScrollPhysics? physics,
    double? containerHeight,
    double? containerWidth,
    double viewportFraction = 1.0,
    double itemHeight = double.infinity,
    double itemWidth = double.infinity,
    bool outer = false,
    double scale = 1.0,
  }) {
    return Swiper(
      transformer: transformer,
      customLayoutOption: customLayoutOption,
      containerHeight: containerHeight,
      containerWidth: containerWidth,
      viewportFraction: viewportFraction,
      itemHeight: itemHeight,
      itemWidth: itemWidth,
      outer: outer,
      scale: scale,
      autoplay: autoplay,
      autoplayDelay: autoplayDelay,
      autoplayDisableOnInteraction: autoplayDisableOnInteraction,
      duration: duration,
      onIndexChanged: onIndexChanged,
      index: index,
      onTap: onTap,
      curve: curve,
      key: key,
      scrollDirection: scrollDirection,
      pagination: pagination,
      control: control,
      controller: controller,
      loop: loop,
      plugins: plugins,
      physics: physics,
      itemBuilder: (BuildContext context, int index) {
        return builder(context, list[index], index);
      },
      itemCount: list.length,
    );
  }

  /// If set true , the pagination will display 'outer' of the 'content' container.
  final bool outer;

  /// Inner item height, this property is valid if layout=STACK or layout=TINDER or LAYOUT=CUSTOM,
  final double itemHeight;

  /// Inner item width, this property is valid if layout=STACK or layout=TINDER or LAYOUT=CUSTOM,
  final double itemWidth;

  // height of the inside container,this property is valid when outer=true,otherwise the inside container size is controlled by parent widget
  final double? containerHeight;

  // width of the inside container,this property is valid when outer=true,otherwise the inside container size is controlled by parent widget
  final double? containerWidth;

  /// Build item on index
  final IndexedWidgetBuilder itemBuilder;

  /// Support transform like Android PageView did
  /// `itemBuilder` and `transformItemBuilder` must have one not null
  final PageTransformer? transformer;

  /// count of the display items
  final int itemCount;

  final ValueChanged<int>? onIndexChanged;

  ///auto play config
  final bool autoplay;

  ///Duration of the animation between transactions (in millisecond).
  final int autoplayDelay;

  ///disable auto play when interaction
  final bool autoplayDisableOnInteraction;

  ///auto play transition duration (in millisecond)
  final int duration;

  ///horizontal/vertical
  final Axis scrollDirection;

  ///transition curve
  final Curve curve;

  /// Set to false to disable continuous loop mode.
  final bool loop;

  ///Index number of initial slide.
  ///If not set , the `Swiper` is 'uncontrolled', which means manage index by itself
  ///If set , the `Swiper` is 'controlled', which means the index is fully managed by parent widget.
  final int? index;

  ///Called when tap
  final SwiperOnTap? onTap;

  ///The swiper pagination plugin
  final SwiperPlugin? pagination;

  ///the swiper control button plugin
  final SwiperPlugin? control;

  ///other plugins, you can custom your own plugin
  final List<SwiperPlugin>? plugins;

  ///
  final SwiperController? controller;

  final ScrollPhysics? physics;

  ///
  final double viewportFraction;

  /// Build in layouts
  final SwiperLayout? layout;

  /// this value is valid when layout == SwiperLayout.CUSTOM
  final CustomLayoutOption? customLayoutOption;

  // This value is valid when viewportFraction is set and < 1.0
  final double? scale;

  // This value is valid when viewportFraction is set and < 1.0
  final double? fade;

  final PageIndicatorLayout indicatorLayout;

  @override
  State<StatefulWidget> createState() {
    return _SwiperState();
  }
}

abstract class _SwiperTimerMixin extends State<Swiper> {
  Timer? _timer;

  SwiperController? _controller;

  @override
  void initState() {
    _controller = widget.controller;
    _controller ??= SwiperController();
    _controller?.addListener(_onController);
    _handleAutoplay();
    super.initState();
  }

  void _onController() {
    switch (_controller?.event) {
      case SwiperController.START_AUTOPLAY:
        {
          if (_timer == null) {
            _startAutoplay();
          }
        }
      case SwiperController.STOP_AUTOPLAY:
        {
          if (_timer != null) {
            _stopAutoplay();
          }
        }
    }
  }

  @override
  void didUpdateWidget(Swiper oldWidget) {
    if (_controller != oldWidget.controller) {
      if (oldWidget.controller != null) {
        oldWidget.controller?.removeListener(_onController);
        _controller = oldWidget.controller;
        _controller?.addListener(_onController);
      }
    }
    _handleAutoplay();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller?.removeListener(_onController);
      //  _controller.dispose();
    }

    _stopAutoplay();
    super.dispose();
  }

  bool _autoplayEnabled() {
    return _controller?.autoplay ?? widget.autoplay;
  }

  void _handleAutoplay() {
    if (_autoplayEnabled() && _timer != null) return;
    _stopAutoplay();
    if (_autoplayEnabled()) {
      _startAutoplay();
    }
  }

  void _startAutoplay() {
    assert(_timer == null, 'Timer must be stopped before start!');
    _timer =
        Timer.periodic(Duration(milliseconds: widget.autoplayDelay), _onTimer);
  }

  void _onTimer(Timer timer) {
    _controller?.next();
  }

  void _stopAutoplay() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }
}

class _SwiperState extends _SwiperTimerMixin {
  int _activeIndex = 0;

  TransformerPageController? _pageController;

  Widget _wrapTap(BuildContext context, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.onTap?.call(index);
      },
      child: widget.itemBuilder(context, index),
    );
  }

  @override
  void initState() {
    _activeIndex = widget.index ?? 0;
    if (_isPageViewLayout()) {
      _pageController = TransformerPageController(
        initialPage: widget.index ?? 0,
        loop: widget.loop,
        itemCount: widget.itemCount,
        reverse: widget.transformer?.reverse ?? false,
        viewportFraction: widget.viewportFraction,
      );
    }
    super.initState();
  }

  bool _isPageViewLayout() {
    return widget.layout == null || widget.layout == SwiperLayout.DEFAULT;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  bool _getReverse(Swiper widget) => widget.transformer?.reverse ?? false;

  @override
  void didUpdateWidget(Swiper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isPageViewLayout()) {
      if (_pageController == null ||
          (widget.index != oldWidget.index ||
              widget.loop != oldWidget.loop ||
              widget.itemCount != oldWidget.itemCount ||
              widget.viewportFraction != oldWidget.viewportFraction ||
              _getReverse(widget) != _getReverse(oldWidget))) {
        _pageController = TransformerPageController(
          initialPage: widget.index ?? 0,
          loop: widget.loop,
          itemCount: widget.itemCount,
          reverse: _getReverse(widget),
          viewportFraction: widget.viewportFraction,
        );
      }
    } else {
      scheduleMicrotask(() {
        // So that we have a chance to do `removeListener` in child widgets.
        if (_pageController != null) {
          _pageController?.dispose();
          _pageController = null;
        }
      });
    }
    if (widget.index != null && widget.index != _activeIndex) {
      _activeIndex = widget.index!;
    }
  }

  void _onIndexChanged(int index) {
    setState(() {
      _activeIndex = index;
    });
    widget.onIndexChanged?.call(index);
  }

  Widget _buildSwiper() {
    IndexedWidgetBuilder itemBuilder;
    if (widget.onTap != null) {
      itemBuilder = _wrapTap;
    } else {
      itemBuilder = widget.itemBuilder;
    }

    if (widget.layout == SwiperLayout.STACK) {
      return _StackSwiper(
        loop: widget.loop,
        itemWidth: widget.itemWidth,
        itemHeight: widget.itemHeight,
        itemCount: widget.itemCount,
        itemBuilder: itemBuilder,
        index: _activeIndex,
        curve: widget.curve,
        duration: widget.duration,
        onIndexChanged: _onIndexChanged,
        controller: _controller!,
        scrollDirection: widget.scrollDirection,
      );
    } else if (_isPageViewLayout()) {
      var transformer = widget.transformer;
      if (widget.scale != null || widget.fade != null) {
        transformer =
            ScaleAndFadeTransformer(scale: widget.scale, fade: widget.fade);
      }

      final Widget child = TransformerPageView(
        pageController: _pageController,
        loop: widget.loop,
        itemCount: widget.itemCount,
        itemBuilder: itemBuilder,
        transformer: transformer,
        viewportFraction: widget.viewportFraction,
        index: _activeIndex,
        duration: Duration(milliseconds: widget.duration),
        scrollDirection: widget.scrollDirection,
        onPageChanged: _onIndexChanged,
        curve: widget.curve,
        physics: widget.physics,
        controller: _controller,
      );
      if (widget.autoplayDisableOnInteraction && widget.autoplay) {
        return NotificationListener(
          child: child,
          onNotification: (ScrollNotification notification) {
            if (notification is ScrollStartNotification) {
              if (notification.dragDetails != null) {
                //by human
                if (_timer != null) _stopAutoplay();
              }
            } else if (notification is ScrollEndNotification) {
              if (_timer == null) _startAutoplay();
            }

            return false;
          },
        );
      }

      return child;
    } else if (widget.layout == SwiperLayout.TINDER) {
      return _TinderSwiper(
        loop: widget.loop,
        itemWidth: widget.itemWidth,
        itemHeight: widget.itemHeight,
        itemCount: widget.itemCount,
        itemBuilder: itemBuilder,
        index: _activeIndex,
        curve: widget.curve,
        duration: widget.duration,
        onIndexChanged: _onIndexChanged,
        controller: _controller!,
        scrollDirection: widget.scrollDirection,
      );
    } else if (widget.layout == SwiperLayout.CUSTOM) {
      return _CustomLayoutSwiper(
        loop: widget.loop,
        option: widget.customLayoutOption,
        itemWidth: widget.itemWidth,
        itemHeight: widget.itemHeight,
        itemCount: widget.itemCount,
        itemBuilder: itemBuilder,
        index: _activeIndex,
        curve: widget.curve,
        duration: widget.duration,
        onIndexChanged: _onIndexChanged,
        controller: _controller!,
        scrollDirection: widget.scrollDirection,
      );
    } else {
      return Container();
    }
  }

  SwiperPluginConfig _ensureConfig(SwiperPluginConfig? config) {
    return config ??
        SwiperPluginConfig(
          outer: widget.outer,
          itemCount: widget.itemCount,
          layout: widget.layout,
          indicatorLayout: widget.indicatorLayout,
          pageController: _pageController,
          activeIndex: _activeIndex,
          scrollDirection: widget.scrollDirection,
          controller: _controller!,
          loop: widget.loop,
        );
  }

  List<Widget> _ensureListForStack(
    Widget swiper,
    List<Widget>? listForStack,
    Widget widget,
  ) {
    if (listForStack == null) {
      return [swiper, widget];
    }
    listForStack.add(widget);
    return listForStack;
  }

  @override
  Widget build(BuildContext context) {
    final swiper = _buildSwiper();
    List<Widget>? listForStack;
    SwiperPluginConfig? config;
    if (widget.control != null) {
      //Stack
      config = _ensureConfig(config);
      listForStack = _ensureListForStack(
        swiper,
        listForStack,
        widget.control!.build(context, config),
      );
    }

    if (widget.plugins != null) {
      config = _ensureConfig(config);
      for (final plugin in widget.plugins!) {
        listForStack = _ensureListForStack(
          swiper,
          listForStack,
          plugin.build(context, config),
        );
      }
    }
    if (widget.pagination != null) {
      config = _ensureConfig(config);
      if (widget.outer) {
        return _buildOuterPagination(
          widget.pagination! as SwiperPagination,
          listForStack == null ? swiper : Stack(children: listForStack),
          config,
        );
      } else {
        listForStack = _ensureListForStack(
          swiper,
          listForStack,
          widget.pagination!.build(context, config),
        );
      }
    }

    if (listForStack != null) {
      return Stack(
        children: listForStack,
      );
    }

    return swiper;
  }

  Widget _buildOuterPagination(
    SwiperPagination pagination,
    Widget swiper,
    SwiperPluginConfig config,
  ) {
    final list = <Widget>[];
    //Only support bottom yet!
    if (widget.containerHeight != null || widget.containerWidth != null) {
      list.add(swiper);
    } else {
      list.add(Expanded(child: swiper));
    }

    list.add(
      Align(
        child: pagination.build(context, config),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}

abstract class _SubSwiper extends StatefulWidget {
  const _SubSwiper({
    required this.itemBuilder,
    required this.controller,
    super.key,
    this.loop = false,
    this.itemHeight = double.infinity,
    this.itemWidth = double.infinity,
    this.duration = 0,
    this.curve = Curves.linear,
    this.index,
    this.itemCount = 0,
    this.scrollDirection = Axis.horizontal,
    this.onIndexChanged,
  });

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final int? index;
  final ValueChanged<int>? onIndexChanged;
  final SwiperController controller;
  final int duration;
  final Curve curve;
  final double itemWidth;
  final double itemHeight;
  final bool loop;
  final Axis? scrollDirection;

  @override
  State<StatefulWidget> createState();

  int getCorrectIndex(int indexNeedsFix) {
    if (itemCount == 0) return 0;
    var value = indexNeedsFix % itemCount;
    if (value < 0) {
      value += itemCount;
    }
    return value;
  }
}

class _TinderSwiper extends _SubSwiper {
  const _TinderSwiper({
    required super.controller,
    required super.itemBuilder,
    super.key,
    super.curve,
    super.duration,
    super.onIndexChanged,
    super.itemHeight,
    super.itemWidth,
    super.index = 0,
    super.loop,
    super.itemCount,
    super.scrollDirection = null,
  });

  @override
  State<StatefulWidget> createState() {
    return _TinderState();
  }
}

class _StackSwiper extends _SubSwiper {
  const _StackSwiper({
    required super.controller,
    required super.itemBuilder,
    super.key,
    super.curve,
    super.duration,
    super.onIndexChanged,
    super.itemHeight = 0,
    super.itemWidth = 0,
    int super.index = 0,
    super.loop,
    super.itemCount,
    super.scrollDirection = null,
  });

  @override
  State<StatefulWidget> createState() {
    return _StackViewState();
  }
}

class _TinderState extends _CustomLayoutStateBase<_TinderSwiper> {
  late List<double> scales;
  late List<double> offsetsX;
  late List<double> offsetsY;
  late List<double> opacity;
  late List<double> rotates;

  double getOffsetY(double scale) {
    return widget.itemHeight - widget.itemHeight * scale;
  }

  @override
  void didUpdateWidget(_TinderSwiper oldWidget) {
    _updateValues();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void afterRender() {
    super.afterRender();

    _startIndex = -3;
    _animationCount = 5;
    opacity = [0.0, 0.9, 0.9, 1.0, 0.0, 0.0];
    scales = [0.80, 0.80, 0.85, 0.90, 1.0, 1.0, 1.0];
    rotates = [0.0, 0.0, 0.0, 0.0, 20.0, 25.0];
    _updateValues();
  }

  void _updateValues() {
    if (widget.scrollDirection == Axis.horizontal) {
      offsetsX = [0.0, 0.0, 0.0, 0.0, _swiperWidth, _swiperWidth];
      offsetsY = [
        0.0,
        0.0,
        -5.0,
        -10.0,
        -15.0,
        -20.0,
      ];
    } else {
      offsetsX = [
        0.0,
        0.0,
        5.0,
        10.0,
        15.0,
        20.0,
      ];

      offsetsY = [0.0, 0.0, 0.0, 0.0, _swiperHeight, _swiperHeight];
    }
  }

  @override
  Widget _buildItem(int i, int realIndex, double animationValue) {
    final s = _getValue(scales, animationValue, i);
    final f = _getValue(offsetsX, animationValue, i);
    final fy = _getValue(offsetsY, animationValue, i);
    final o = _getValue(opacity, animationValue, i);
    final a = _getValue(rotates, animationValue, i);

    final alignment = widget.scrollDirection == Axis.horizontal
        ? Alignment.bottomCenter
        : Alignment.centerLeft;

    return Opacity(
      opacity: o,
      child: Transform.rotate(
        angle: a / 180.0,
        child: Transform.translate(
          key: ValueKey<int>(_currentIndex + i),
          offset: Offset(f, fy),
          child: Transform.scale(
            scale: s,
            alignment: alignment,
            child: SizedBox(
              width: widget.itemWidth,
              height: widget.itemHeight,
              child: widget.itemBuilder(context, realIndex),
            ),
          ),
        ),
      ),
    );
  }
}

class _StackViewState extends _CustomLayoutStateBase<_StackSwiper> {
  late List<double> scales;
  late List<double> offsets;
  late List<double> opacity;

  void _updateValues() {
    if (widget.scrollDirection == Axis.horizontal) {
      final space = (_swiperWidth - widget.itemWidth) / 2;
      offsets = [-space, -space / 3 * 2, -space / 3, 0.0, _swiperWidth];
    } else {
      final space = (_swiperHeight - widget.itemHeight) / 2;
      offsets = [-space, -space / 3 * 2, -space / 3, 0.0, _swiperHeight];
    }
  }

  @override
  void didUpdateWidget(_StackSwiper oldWidget) {
    _updateValues();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void afterRender() {
    super.afterRender();

    //length of the values array below
    _animationCount = 5;

    //Array below this line, '0' index is 1.0 ,witch is the first item show in swiper.
    _startIndex = -3;
    scales = [0.7, 0.8, 0.9, 1.0, 1.0];
    opacity = [0.0, 0.5, 1.0, 1.0, 1.0];

    _updateValues();
  }

  @override
  Widget _buildItem(int i, int realIndex, double animationValue) {
    final s = _getValue(scales, animationValue, i);
    final f = _getValue(offsets, animationValue, i);
    final o = _getValue(opacity, animationValue, i);

    final offset =
        widget.scrollDirection == Axis.horizontal ? Offset(f, 0) : Offset(0, f);

    final alignment = widget.scrollDirection == Axis.horizontal
        ? Alignment.centerLeft
        : Alignment.topCenter;

    return Opacity(
      opacity: o,
      child: Transform.translate(
        key: ValueKey<int>(_currentIndex + i),
        offset: offset,
        child: Transform.scale(
          scale: s,
          alignment: alignment,
          child: SizedBox(
            width: widget.itemWidth,
            height: widget.itemHeight,
            child: widget.itemBuilder(context, realIndex),
          ),
        ),
      ),
    );
  }
}

class ScaleAndFadeTransformer extends PageTransformer {
  ScaleAndFadeTransformer({double? fade, double? scale})
      : _fade = fade ?? 0.3,
        _scale = scale ?? 0.8;
  final double _scale;
  final double _fade;

  @override
  Widget transform(Widget item, TransformInfo info) {
    final position = info.position;
    var child = item;
    final scaleFactor = (1 - position.abs()) * (1 - _scale);
    final scale = _scale + scaleFactor;

    child = Transform.scale(
      scale: scale,
      child: item,
    );

    final fadeFactor = (1 - position.abs()) * (1 - _fade);
    final opacity = _fade + fadeFactor;

    return Opacity(
      opacity: opacity,
      child: child,
    );
  }
}
