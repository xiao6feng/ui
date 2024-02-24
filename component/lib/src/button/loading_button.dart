import 'package:component/src/button/button_size.dart';
import 'package:flutter/material.dart' hide ButtonTheme;
import 'package:theme/theme.dart';

/// ui 设计主要按钮
class LoadingButton extends StatefulWidget {
  const LoadingButton({
    required this.child,
    Key? key,
    this.disabled = false,
    this.block = false,
    this.progressSize,
    this.loadingStatus = false,
    this.strokeWidth = 2.0,
    this.onPressed,
    this.size = ButtonSize.middle,
  }) : super(key: key);

  final bool disabled;
  final bool block;
  final Widget child;
  final ButtonSize size;
  final VoidCallback? onPressed;
  final double strokeWidth;
  final double? progressSize;
  final bool loadingStatus;

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isPressed = false;

  double get height {
    final ButtonTheme? theme =
        Theme.of(context).extension<AppTheme>()?.buttonTheme;
    switch (widget.size) {
      case ButtonSize.large:
        return theme == null ? 40 : theme.largeButtonHeight;
      case ButtonSize.middle:
        return theme == null ? 32 : theme.middleButtonHeight;
      case ButtonSize.small:
        return theme == null ? 28 : theme.smallButtonHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonTheme? theme =
        Theme.of(context).extension<AppTheme>()?.buttonTheme;

    Widget current = widget.child;
    current = DefaultTextStyle(
      style: TextStyle(
        color: theme?.textTheme.titleColor ?? Colors.white,
        height: 1.1,
        fontSize: widget.size == ButtonSize.large
            ? theme?.largeButtonFontSize
            : widget.size == ButtonSize.middle
                ? theme?.middleButtonFontSize
                : theme?.smallButtonFontSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.loadingStatus)
            SizedBox(
              width: widget.progressSize ?? 18,
              height: widget.progressSize ?? 18,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white.withOpacity(.20),
                strokeWidth: widget.strokeWidth,
                valueColor: const AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          if (widget.loadingStatus) const SizedBox(width: 8),
          widget.child,
        ],
      ),
    );
    current = widget.block
        ? current
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: height / 2),
            child: current,
          );
    current = SizedBox(
        width: widget.block ? double.infinity : null,
        height: height,
        child: current);

    current = DecoratedBox(
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        gradient: theme?.primaryGradient ??
            LinearGradient(
              colors: theme == null
                  ? [Color(0xffFF9047), Color(0xffFF5722)]
                  : [theme.primaryGradientColorA, theme.primaryGradientColorB],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
      ),
      child: current,
    );
    if (_isPressed) {
      current = DecoratedBox(
        decoration: ShapeDecoration(
            shape: const StadiumBorder(), color: Colors.black.withOpacity(0.1)),
        position: DecorationPosition.foreground,
        child: current,
      );
    }
    current = widget.disabled || widget.loadingStatus
        ? AnimatedOpacity(
            opacity: 0.6,
            duration: const Duration(milliseconds: 250),
            child: current)
        : current;
    return GestureDetector(
      onTap: widget.disabled || widget.loadingStatus ? null : widget.onPressed,
      child: current,
      onTapDown: (_) {
        if (!widget.disabled) {
          setState(() {
            _isPressed = true;
          });
        }
      },
      onTapUp: (_) {
        if (!widget.disabled) {
          setState(() {
            _isPressed = false;
          });
        }
      },
      onTapCancel: () {
        if (!widget.disabled) {
          setState(() {
            _isPressed = false;
          });
        }
      },
    );
  }
}
