import 'package:flutter/material.dart' hide DialogTheme;
import 'package:theme/theme.dart';

const EdgeInsets _defaultInsetPadding = EdgeInsets.all(16);

///
class RawDialog extends StatelessWidget {
  ///
  const RawDialog({
    super.key,
    this.insetPadding,
    this.shape,
    this.background,
    this.titleWidget,
    this.contentWidget,
    this.actionsWidget,
  });

  ///
  final EdgeInsets? insetPadding;

  ///
  final Color? background;

  ///
  final ShapeBorder? shape;

  ///
  final Widget? titleWidget;

  ///
  final Widget? contentWidget;

  ///
  final Widget? actionsWidget;

  @override
  Widget build(BuildContext context) {
    final dialogTheme = Theme.of(context).extension<AppTheme>()?.dialogTheme;
    return Dialog(
      shape: shape ?? dialogTheme?.shape,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      backgroundColor: background ?? dialogTheme?.backgroundColor,
      child: Container(
        padding:
            insetPadding ?? dialogTheme?.insetPadding ?? _defaultInsetPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (titleWidget != null)
              DefaultTextStyle(
                style: dialogTheme?.titleTextStyle ??
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                child: titleWidget!,
              ),
            if (contentWidget != null)
              DefaultTextStyle(
                style: dialogTheme?.contentTextStyle ??
                    const TextStyle(
                      color: Color(0x99FFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                child: contentWidget!,
              ),
            if (actionsWidget != null) actionsWidget!,
          ],
        ),
      ),
    );
  }
}
