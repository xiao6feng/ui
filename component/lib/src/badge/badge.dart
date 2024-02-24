import 'package:flutter/material.dart' hide BadgeTheme;
import 'package:theme/theme.dart';

const BoxConstraints _kCountConstraints =
    BoxConstraints.tightFor(width: 14, height: 14);
const TextStyle _kCountTextStyle = TextStyle(fontSize: 10, color: Colors.white);
const BoxConstraints _kDotConstraints =
    BoxConstraints.tightFor(width: 8, height: 8);
const Color _kBadgeColor = Color(0xffFF5722);
const Border _kDotBorder = Border.fromBorderSide(
  BorderSide(
    color: Colors.white,
  ),
);

/// 徽标数
class Badge extends StatelessWidget {
  /// 图标右上角的圆形徽标数字。
  const Badge({
    super.key,
    this.showZero = false,
    this.dot = false,
    this.overflowCount = 99,
    this.count,
    this.color,
    this.child,
    this.dotBorder,
    this.countConstraints,
    this.dotConstraints,
    this.style = const TextStyle(fontSize: 10, color: Colors.white),
  });

  /// 只展示数字
  const Badge.number({
    super.key,
    this.showZero = false,
    this.overflowCount = 99,
    this.count,
    this.color,
    this.child,
    this.countConstraints =
        const BoxConstraints.tightFor(width: 14, height: 14),
    this.style,
  })  : dot = false,
        dotBorder = null,
        dotConstraints = null;

  /// 只展示圆点
  const Badge.dot({
    super.key,
    this.color,
    this.child,
    this.dotBorder,
    this.dotConstraints,
  })  : showZero = false,
        dot = true,
        overflowCount = 99,
        count = null,
        countConstraints = null,
        style = null;

  /// 当数值为 0 时，是否展示 Badge
  final bool showZero;

  /// 不展示数字，只有一个小红点
  final bool dot;

  /// 展示封顶的数字值
  final num overflowCount;

  /// 展示的数字，大于[overflowCount] 时显示为 ${overflowCount}+，为 0 时隐藏
  final num? count;

  /// 自定义小圆点的颜色
  final Color? color;

  /// 展示数字时的约束
  final BoxConstraints? countConstraints;

  /// 展示圆点时的约束
  final BoxConstraints? dotConstraints;

  /// 展示文字的 style
  final TextStyle? style;

  /// 圆点边框
  final Border? dotBorder;

  /// 需要展示徽标数 child
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final numberedDisplayCount =
        (count ?? 0) > overflowCount ? '$overflowCount+' : '${count ?? 0}';
    final isZero = numberedDisplayCount == '0';
    final showAsDot = dot && !isZero;
    final mergedCount = showAsDot ? '' : numberedDisplayCount;
    final isHidden =
        (mergedCount.isEmpty || (isZero && !showZero)) && !showAsDot;
    final badge = isHidden
        ? const SizedBox.shrink()
        : showAsDot
            ? dotBadge(context)
            : _getCountBadge(mergedCount, context);
    return child == null
        ? badge
        : Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.none,
            children: <Widget>[
              child!,
              PositionedDirectional(
                top: 0,
                end: 0,
                child: FractionalTranslation(
                  translation: const Offset(0.5, -0.5),
                  child: badge,
                ),
              ),
            ],
          );
  }

  Widget _getCountBadge(String count, BuildContext context) {
    final badgeTheme = Theme.of(context).extension<AppTheme>()?.badgeTheme;
    return Container(
      constraints: countConstraints ??
          badgeTheme?.countConstraints ??
          _kCountConstraints,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: color ?? badgeTheme?.badgeColor ?? _kBadgeColor,
      ),
      child: Center(
        child: Text(
          count,
          textAlign: TextAlign.center,
          style:
              (style ?? badgeTheme?.countTextStyle ?? _kCountTextStyle).merge(
            const TextStyle(
              fontFamily: 'DIN-Medium',
              package: 'component',
            ),
          ),
        ),
      ),
    );
  }

  ///
  Widget dotBadge(BuildContext context) {
    final badgeTheme = Theme.of(context).extension<AppTheme>()?.badgeTheme;
    return Container(
      constraints:
          dotConstraints ?? badgeTheme?.dotConstraints ?? _kDotConstraints,
      decoration: BoxDecoration(
        border: dotBorder ?? badgeTheme?.dotBorder ?? _kDotBorder,
        shape: BoxShape.circle,
        color: color ?? badgeTheme?.badgeColor ?? _kBadgeColor,
      ),
    );
  }
}
