import 'package:flutter/material.dart' hide ButtonTheme;
import 'package:theme/theme.dart';

import 'button_size.dart';

///
class SecondaryButton extends StatelessWidget {
  ///
  const SecondaryButton({
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
  Widget build(BuildContext context) {
    final ButtonTheme? theme =
        Theme.of(context).extension<AppTheme>()?.buttonTheme;

    Widget current = child;
    current = DefaultTextStyle(
      style: TextStyle(
        color: theme?.textTheme.titleColor,
        fontSize: size == ButtonSize.large
            ? theme?.largeButtonFontSize
            : size == ButtonSize.middle
                ? theme?.middleButtonFontSize
                : theme?.smallButtonFontSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[child],
        mainAxisSize: MainAxisSize.min,
      ),
    );
    current = block
        ? current
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: height(context) / 2),
            child: current,
          );
    current = SizedBox(
        width: block ? double.infinity : null,
        height: height(context),
        child: current);
    current = DecoratedBox(
      decoration: BoxDecoration(
        gradient: theme?.secondaryGradient,
        color: theme?.secondaryGradient == null ? fillColor(context) : null,
        borderRadius:
            BorderRadius.circular(theme?.radius ?? height(context) / 2),
      ),
      child: current,
    );

    current = disabled ? Opacity(opacity: 0.6, child: current) : current;
    return GestureDetector(onTap: disabled ? null : onPressed, child: current);
  }

  ///
  double height(BuildContext context) {
    final ButtonTheme? theme =
        Theme.of(context).extension<AppTheme>()?.buttonTheme;
    switch (size) {
      case ButtonSize.large:
        return theme?.largeButtonHeight ?? 40;
      case ButtonSize.middle:
        return theme?.middleButtonHeight ?? 32;
      case ButtonSize.small:
        return theme?.smallButtonHeight ?? 28;
    }
  }

  ///
  Color fillColor(BuildContext context) {
    final ButtonTheme? theme =
        Theme.of(context).extension<AppTheme>()?.buttonTheme;
    switch (size) {
      case ButtonSize.large:
        return theme?.largeButtonFillColor ?? Colors.white.withOpacity(0.2);
      case ButtonSize.middle:
        return theme?.middleButtonFillColor ?? Color(0x0fffffff);
      case ButtonSize.small:
        return theme?.smallButtonFillColor ?? Color(0x0fffffff);
    }
  }
}
