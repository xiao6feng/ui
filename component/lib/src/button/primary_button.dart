import 'package:flutter/material.dart' hide ButtonTheme;
import 'package:theme/theme.dart';

import 'button_size.dart';

/// ui 设计主要按钮
class PrimaryButton extends StatefulWidget {
  /// ui 设计主要按钮
  const PrimaryButton({
    required this.child,
    Key? key,
    this.disabled = false,
    this.block = false,
    this.onPressed,
    this.size = ButtonSize.middle,
  }) : super(key: key);

  ///
  final bool disabled;

  ///
  final bool block;

  ///
  final Widget child;

  ///
  final ButtonSize size;

  ///
  final VoidCallback? onPressed;

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
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

    var current = widget.child;
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
        children: <Widget>[widget.child],
        mainAxisSize: MainAxisSize.min,
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
      decoration: BoxDecoration(
          gradient: theme?.primaryGradient ??
              LinearGradient(
                colors: theme == null
                    ? [Color(0xffFF9047), Color(0xffFF5722)]
                    : [
                        theme.primaryGradientColorA,
                        theme.primaryGradientColorB
                      ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
          borderRadius: BorderRadius.circular(theme?.radius ?? height / 2)),
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
    current = widget.disabled
        ? AnimatedOpacity(
            opacity: 0.6,
            duration: const Duration(milliseconds: 250),
            child: current)
        : current;
    return GestureDetector(
      onTap: widget.disabled ? null : widget.onPressed,
      child: current,
      onTapDown: (_) {
        if (!widget.disabled)
          setState(() {
            _isPressed = true;
          });
      },
      onTapUp: (_) {
        if (!widget.disabled)
          setState(() {
            _isPressed = false;
          });
      },
      onTapCancel: () {
        if (!widget.disabled)
          setState(() {
            _isPressed = false;
          });
      },
    );
  }
}
