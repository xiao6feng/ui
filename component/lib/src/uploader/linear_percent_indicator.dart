import 'package:flutter/material.dart';

/// 圆角进度条
class LinearPercentIndicator extends StatefulWidget {
  ///
  const LinearPercentIndicator({
    required this.percent,
    this.height = 3.0,
    this.colors = const <Color>[
      Color(0xFFFF5722),
      Color(0xFFFF5722),
    ],
    this.backgroundColor = Colors.white30,
    this.stops,
  });

  ///画笔的宽度，其实是进度条的高度
  final double height;

  ///进度值
  final double percent;

  ///进度条背景色
  final Color backgroundColor;

  ///渐变的颜色列表
  final List<Color> colors;

  final List<double>? stops;

  @override
  State<LinearPercentIndicator> createState() => _LinearPercentIndicatorState();
}

class _LinearPercentIndicatorState extends State<LinearPercentIndicator>
    with TickerProviderStateMixin<LinearPercentIndicator> {
  AnimationController get positionController => _positionController;
  late AnimationController _positionController;

  @override
  void initState() {
    super.initState();
    _positionController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromHeight(widget.height),
      painter: _LinearPercentIndicatorPainter(
        backgroundColor: widget.backgroundColor,
        percent: widget.percent,
        colors: widget.colors,
        stops: widget.stops,
      ),
    );
  }

  @override
  void dispose() {
    _positionController.dispose();
    super.dispose();
  }
}

class _LinearPercentIndicatorPainter extends CustomPainter {
  ///
  _LinearPercentIndicatorPainter({
    required this.backgroundColor,
    required this.colors,
    required this.percent,
    this.stops,
  });

  ///
  final double percent;

  ///
  final Color backgroundColor;

  ///
  final List<Color> colors;

  ///
  final List<double>? stops;

  ///
  final Paint _backgroundPaint = Paint();

  final Paint _percentPaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    _drawBackground(canvas, _backgroundPaint, size);
    _drawIndicator(canvas, _percentPaint, size, percent);
  }

  void _drawBackground(Canvas canvas, Paint p, Size size) {
    final Path backgroundPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(size.height / 2),
        ),
      );
    canvas.drawPath(backgroundPath, p..color = backgroundColor);
    canvas.clipPath(backgroundPath);
  }

  void _drawIndicator(Canvas canvas, Paint p, Size size, double percent) {
    final Offset end = Offset(percent * size.width, size.height);
    final Path indicatorPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, percent * size.width, size.height),
          Radius.circular(size.height / 2),
        ),
      );
    p.shader = LinearGradient(colors: colors, stops: stops).createShader(
      Rect.fromPoints(
        Offset.zero,
        end,
      ),
    );
    canvas.drawPath(indicatorPath, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
