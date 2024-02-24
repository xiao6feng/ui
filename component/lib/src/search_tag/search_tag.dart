import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class SearchTag extends StatelessWidget {
  const SearchTag({
    Key? key,
    this.title,
    this.titleWidget,
    this.tags,
    this.tagWidgets,
    this.tagPadding,
    this.tagRadius,
    this.titlePadding,
    this.titleStyle,
    this.tagStyle,
    this.tagBackgroundColor,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.wrapSpacing,
    this.runAlignment = WrapAlignment.start,
    this.wrapRunSpacing,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
    this.onTap,
  }) : super(key: key);

  final ValueChanged<int>? onTap;
  final String? title;
  final Widget? titleWidget;
  final List<String>? tags;
  final List<Widget>? tagWidgets;

  final EdgeInsets? titlePadding;
  final TextStyle? titleStyle;

  final Color? tagBackgroundColor;
  final EdgeInsets? tagPadding;
  final double? tagRadius;
  final TextStyle? tagStyle;

  final Axis direction;
  final WrapAlignment alignment;
  final double? wrapSpacing;
  final WrapAlignment runAlignment;
  final double? wrapRunSpacing;
  final WrapCrossAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()?.searchTagTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (title != null)
        Padding(
          padding: titlePadding ?? theme?.titlePadding ?? EdgeInsets.zero,
          child: Text(
            title!,
            style: titleStyle ?? theme?.titleStyle,
          ),
        ),
      if (titleWidget != null) titleWidget!,
      Wrap(
        runSpacing: wrapRunSpacing ?? theme?.runSpacing ?? 12,
        spacing: wrapSpacing ?? theme?.spacing ?? 12,
        direction: direction,
        alignment: alignment,
        runAlignment: runAlignment,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        clipBehavior: clipBehavior,
        children: _buildTags(context),
      ),
    ]);
  }

  List<Widget> _buildTags(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()?.searchTagTheme;

    if (tags != null)
      return tags!
          .map((e) => GestureDetector(
                onTap: onTap == null
                    ? null
                    : () {
                        final index = tags!.indexOf(e);
                        onTap!(index);
                      },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        tagRadius ?? theme?.tagRadius ?? 0),
                    color: tagBackgroundColor ?? theme?.tagBackgroundColor,
                  ),
                  padding: tagPadding ?? theme?.tagPadding,
                  child: Text(
                    e,
                    style: tagStyle ?? theme?.tagStyle,
                  ),
                ),
              ))
          .toList();
    if (tagWidgets != null) return tagWidgets!;
    return [];
  }
}
