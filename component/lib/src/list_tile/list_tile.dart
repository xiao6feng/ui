import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class ObListTile extends StatelessWidget {
  const ObListTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.visualDensity,
    this.shape,
    this.style,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.leadingAndTrailingTextStyle,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.focusNode,
    this.autofocus = false,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.titleAlignment,
  }) : super(key: key);

  final Widget? leading;

  final Widget? title;

  final Widget? subtitle;

  final Widget? trailing;

  final bool isThreeLine;

  final bool? dense;

  final VisualDensity? visualDensity;

  final ShapeBorder? shape;

  final Color? selectedColor;

  final Color? iconColor;

  final Color? textColor;

  final TextStyle? titleTextStyle;

  final TextStyle? subtitleTextStyle;

  final TextStyle? leadingAndTrailingTextStyle;

  final ListTileStyle? style;

  final EdgeInsetsGeometry? contentPadding;

  final bool enabled;

  final GestureTapCallback? onTap;

  final GestureLongPressCallback? onLongPress;

  final ValueChanged<bool>? onFocusChange;

  final MouseCursor? mouseCursor;

  final bool selected;

  final Color? focusColor;

  final Color? hoverColor;

  final Color? splashColor;

  final FocusNode? focusNode;

  final bool autofocus;

  final Color? tileColor;

  final Color? selectedTileColor;

  final bool? enableFeedback;

  final double? horizontalTitleGap;

  final double? minVerticalPadding;

  final double? minLeadingWidth;

  final ListTileTitleAlignment? titleAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()?.listTileTheme;

    return ListTile(
      leading: leading,
      title: title,
      // subtitle: subtitle,
      //subtitleTextStyle useMaterial3 失效
      //https://github.com/flutter/flutter/issues/133412
      subtitle: subtitle == null
          ? null
          : DefaultTextStyle(
              style: subtitleTextStyle ??
                  theme?.subtitleTextStyle ??
                  TextStyle(
                      color: Color(0x99FFFFFF),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
              child: subtitle!),
      trailing: trailing,
      isThreeLine: isThreeLine,
      dense: dense,
      visualDensity: visualDensity,
      shape: shape,
      style: style,
      selectedColor: selectedColor,
      iconColor: iconColor,
      textColor: textColor,
      titleTextStyle: titleTextStyle ?? theme?.titleTextStyle,
      subtitleTextStyle: subtitleTextStyle ?? theme?.subtitleTextStyle,
      leadingAndTrailingTextStyle:
          leadingAndTrailingTextStyle ?? theme?.leadingAndTrailingTextStyle,
      contentPadding: contentPadding ?? theme?.contentPadding,
      enabled: enabled,
      onTap: onTap,
      onLongPress: onLongPress,
      onFocusChange: onFocusChange,
      mouseCursor: mouseCursor,
      selected: selected,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      focusNode: focusNode,
      autofocus: autofocus,
      tileColor: tileColor,
      selectedTileColor: selectedTileColor,
      enableFeedback: enableFeedback,
      horizontalTitleGap: horizontalTitleGap,
      minVerticalPadding: minVerticalPadding,
      minLeadingWidth: minLeadingWidth,
      titleAlignment: titleAlignment,
    );
  }
}
