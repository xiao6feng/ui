import 'package:flutter/material.dart';

enum BorderRadiusType {
  All,
  AboveLeftandRight,
  BelowLeftandRight,
  Left,
  Right,
}

class LivedGestureDetector extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final HitTestBehavior? behavior;
  final BorderRadiusType? radiusType;
  final double radius;
  final BorderRadiusGeometry? borderRadius;

  LivedGestureDetector({
    super.key,
    this.onTap,
    this.child,
    this.behavior,
    this.radiusType,
    this.radius = 0.0,
    this.borderRadius,
  });

  @override
  _LivedGestureDetectorState createState() => _LivedGestureDetectorState();
}

class _LivedGestureDetectorState extends State<LivedGestureDetector> {
  bool _isPressed = false;
  BorderRadiusGeometry? borderRadius;

  @override
  void initState() {
    borderRadius = widget.borderRadius;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      // onPanDown: (_) {
      //   setState(() {
      //     _isPressed = true;
      //   });
      // },
      // onPanEnd: (_) {
      //   setState(() {
      //     _isPressed = false;
      //   });
      // },
      // onPanCancel: () {
      //   setState(() {
      //     _isPressed = false;
      //   });
      // },
      // onTapDown: (_) {
      //   setState(() {
      //     _isPressed = true;
      //   });
      // },
      // onTapUp: (_) {
      //   setState(() {
      //     _isPressed = false;
      //   });
      // },
      // onTapCancel: () {
      //   setState(() {
      //     _isPressed = false;
      //   });
      // },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: _radiusGeometry(),
          color:
              _isPressed ? Colors.white.withOpacity(0.06) : Colors.transparent,
        ),
        position: DecorationPosition.foreground,
        child: widget.child,
      ),
    );
  }

  BorderRadiusGeometry? _radiusGeometry() {
    if (borderRadius != null) {
      return borderRadius;
    }

    switch (widget.radiusType) {
      case BorderRadiusType.All:
        return borderRadius;
      case BorderRadiusType.AboveLeftandRight:
        borderRadius = BorderRadius.only(
          topLeft: Radius.circular(widget.radius),
          topRight: Radius.circular(widget.radius),
        );
        return borderRadius;
      case BorderRadiusType.BelowLeftandRight:
        borderRadius = BorderRadius.only(
          bottomLeft: Radius.circular(widget.radius),
          bottomRight: Radius.circular(widget.radius),
        );
        return borderRadius;
      case BorderRadiusType.Left:
        borderRadius = BorderRadius.only(
          topLeft: Radius.circular(widget.radius),
          bottomLeft: Radius.circular(widget.radius),
        );
        return borderRadius;
      case BorderRadiusType.Right:
        borderRadius = BorderRadius.only(
          topRight: Radius.circular(widget.radius),
          bottomRight: Radius.circular(widget.radius),
        );
        return borderRadius;
      default:
        return borderRadius;
    }
  }
}
