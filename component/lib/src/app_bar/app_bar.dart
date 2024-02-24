import 'package:component/component.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:theme/theme.dart';

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool? centerTitle;
  final double? titleSpacing;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;

  final double? elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;

  const AppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = false,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle = true,
    this.titleSpacing,
    this.toolbarHeight,
    this.leadingWidth = 48,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor = material
        .Colors.transparent, //Material3 disable appbar color change on scroll
  });

  @override
  Widget build(BuildContext context) {
    final AppBarTheme? theme =
        material.Theme.of(context).extension<AppTheme>()?.appBarTheme;
    return material.AppBar(
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      shadowColor: shadowColor ?? theme?.shadowColor,
      leading: automaticallyImplyLeading
          ? BackButton()
          : leading ?? theme?.leadIconBuilder?.call(),
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () => _handleTitleTap(context),
        child: title,
      ),
      actions: actions,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      shape: shape,
      backgroundColor: backgroundColor ?? theme?.backgroundColor,
      foregroundColor: foregroundColor ?? theme?.foregroundColor,
      iconTheme: iconTheme ?? theme?.iconTheme,
      actionsIconTheme: actionsIconTheme ?? theme?.actionsIconTheme,
      primary: primary,
      centerTitle: centerTitle,
      titleSpacing: titleSpacing,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      toolbarTextStyle: toolbarTextStyle ?? theme?.actionsStyle,
      titleTextStyle: titleTextStyle ?? theme?.titleStyle,
      systemOverlayStyle: systemOverlayStyle ?? theme?.systemUiOverlayStyle,
      surfaceTintColor: surfaceTintColor,
    );
  }

  void _handleTitleTap(BuildContext context) {
    final ScrollController? primaryScrollController =
        PrimaryScrollController.maybeOf(context);
    if (primaryScrollController != null && primaryScrollController.hasClients) {
      primaryScrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCirc,
      );
    }
  }

  @override
  Size get preferredSize =>
      Size.fromHeight((toolbarHeight ?? material.kToolbarHeight) +
          (bottom?.preferredSize.height ?? 0));
}
