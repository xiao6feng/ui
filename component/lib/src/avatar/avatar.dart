import 'package:flutter/material.dart' hide TextTheme;
import 'package:theme/theme.dart';

/// 头像控件
class Avatar extends StatelessWidget {
  /// 矩形圆角 像
  const Avatar.rectangle({
    required this.rectangleRadius,
    super.key,
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.foregroundColor,
    this.foregroundImageColorFilter,
    this.backgroundImageColorFilter,
  })  : shape = BoxShape.rectangle,
        radius = null,
        minRadius = null,
        maxRadius = null;

  /// 圆形控件
  const Avatar.circle({
    super.key,
    this.child,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.foregroundColor,
    this.radius,
    this.minRadius,
    this.maxRadius,
    this.foregroundImageColorFilter,
    this.backgroundImageColorFilter,
  })  : shape = BoxShape.circle,
        rectangleRadius = 0,
        assert(radius == null || (minRadius == null && maxRadius == null)),
        assert(backgroundImage != null || onBackgroundImageError == null),
        assert(foregroundImage != null || onForegroundImageError == null);

  /// 子控件
  final Widget? child;

  ///图片形状
  final BoxShape shape;

  ///背景颜色
  final Color? backgroundColor;

  ///
  final Color? foregroundColor;

  ///
  final ImageProvider? backgroundImage;

  ///
  final ImageProvider? foregroundImage;

  ///
  final ImageErrorListener? onBackgroundImageError;

  ///
  final ImageErrorListener? onForegroundImageError;

  ///半径
  final double? radius;

  ///
  final double? minRadius;

  ///最小半径
  final double? maxRadius;

  ///矩形半径
  final double rectangleRadius;

  ///
  final Color? backgroundImageColorFilter;

  ///
  final Color? foregroundImageColorFilter;

  // The default radius if nothing is specified.
  static const double _defaultRadius = 20;

  // The default min if only the max is specified.
  static const double _defaultMinRadius = 0;

  // The default max if only the min is specified.
  static const double _defaultMaxRadius = double.infinity;

  double get _minDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      return _defaultRadius * 2.0;
    }
    return 2.0 * (radius ?? minRadius ?? _defaultMinRadius);
  }

  double get _maxDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      return _defaultRadius * 2.0;
    }
    return 2.0 * (radius ?? maxRadius ?? _defaultMaxRadius);
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));

    final avatarTheme = Theme.of(context).extension<AppTheme>()?.avatarTheme;

    final textTheme = Theme.of(context).extension<AppTheme>()?.textTheme;

    final effectiveBackgroundColor =
        backgroundColor ?? avatarTheme?.backgroundColor;

    final textStyle = avatarTheme?.textStyle ?? textTheme?.subtitleStyle;

    final minDiameter = _minDiameter;
    final maxDiameter = _maxDiameter;
    return AnimatedContainer(
      constraints: BoxConstraints(
        minHeight: minDiameter,
        minWidth: minDiameter,
        maxWidth: maxDiameter,
        maxHeight: maxDiameter,
      ),
      duration: kThemeChangeDuration,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: shape == BoxShape.rectangle
            ? BorderRadius.all(Radius.circular(rectangleRadius))
            : null,
        image: backgroundImage != null
            ? DecorationImage(
                image: backgroundImage!,
                colorFilter: backgroundImageColorFilter != null
                    ? ColorFilter.mode(
                        backgroundImageColorFilter!, BlendMode.dstATop)
                    : null,
                onError: onBackgroundImageError,
                fit: BoxFit.cover,
              )
            : null,
        shape: shape,
      ),
      foregroundDecoration: foregroundImage != null
          ? BoxDecoration(
              borderRadius: shape == BoxShape.rectangle
                  ? BorderRadius.all(Radius.circular(rectangleRadius))
                  : null,
              image: DecorationImage(
                image: foregroundImage!,
                colorFilter: foregroundImageColorFilter != null
                    ? ColorFilter.mode(
                        foregroundImageColorFilter!, BlendMode.dstATop)
                    : null,
                onError: onForegroundImageError,
                fit: BoxFit.cover,
              ),
              shape: shape,
            )
          : null,
      child: child == null
          ? null
          : Center(
              child: MediaQuery(
                // Need to ignore the ambient textScaleFactor here so that the
                // text doesn't escape the avatar
                // when the textScaleFactor is large.
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: DefaultTextStyle(
                  style: textStyle ??
                      const TextStyle(
                        fontSize: 14,
                        color: Color(0x99FFFFFF),
                        fontWeight: FontWeight.w400,
                      ),
                  child: child!,
                ),
              ),
            ),
    );
  }
}
