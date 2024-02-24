import 'dart:ui';
import 'package:component/gen/assets.gen.dart';
import 'package:component/src/avatar/avatar.dart';
import 'package:component/src/popup_menu/popup_menu.dart';
import 'package:component/src/popup_menu/toggle_item_user.dart';
import 'package:component/src/text_field/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropdownTextField extends StatefulWidget {
  final TextEditingController? editingController;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final bool autofocus;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;

  final String? hintText;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;
  final EdgeInsetsGeometry? contentPadding;

  final int? maxLength;
  final int? maxLines;
  final Color? cursorColor;
  final Color? fillColor;
  final double? width;
  final double? height;

  final TextAlign textAlign;

  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final List<UIToggleItemUser>? options;
  final bool isShowClean;
  final VoidCallback? onClean;

  //popup menu
  final Function(int)? onUserChoose;
  final Function(int)? onUserRemove;
  final PressType pressType;
  final bool showArrow;
  final Color? arrowColor;
  final Color? barrierColor;
  final double horizontalMargin;
  final double verticalMargin;
  final double arrowSize;
  final ObPopupMenuController? menuController;
  final Widget Function()? menuBuilder;
  final PreferredPosition? position;
  final void Function(bool)? menuOnChange;
  final bool enablePassEvent;

  final Widget? error;
  final int? errorMaxLines;
  final TextStyle? errorStyle;
  final String? errorText;

  final VoidCallback? onTap;
  final bool readOnly;

  const DropdownTextField({
    Key? key,
    this.editingController,
    this.onChanged,
    this.inputFormatters,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
    this.obscureText = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.hintText,
    this.keyboardType,
    this.onSubmitted,
    this.contentPadding =
        const EdgeInsets.only(left: 16, top: 13, bottom: 13, right: 8),
    this.maxLength,
    this.textStyle,
    this.hintStyle,
    this.border = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide.none),
    this.focusedBorder,
    this.errorBorder,
    this.cursorColor,
    this.fillColor = Colors.white10,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    thisidth,
    this.height,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.contextMenuBuilder,
    this.options,
    this.isShowClean = true,
    this.onClean,
    this.onUserChoose,
    this.width,
    this.onUserRemove,
    this.menuBuilder,
    this.menuController,
    this.horizontalMargin = 0,
    this.verticalMargin = 8,
    this.position,
    this.menuOnChange,
    this.pressType = PressType.singleClick,
    this.showArrow = false,
    this.arrowColor,
    this.barrierColor,
    this.arrowSize = 10,
    this.enablePassEvent = true,
    this.error,
    this.errorMaxLines,
    this.errorStyle,
    this.errorText,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<DropdownTextField> createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  final ValueNotifier<bool> _dropDown = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _enableClean = ValueNotifier<bool>(false);

  late ObPopupMenuController _menuController;
  late bool enableDropDown;

  @override
  void initState() {
    enableDropDown = widget.options != null && widget.options!.isNotEmpty;
    _menuController = widget.menuController ?? ObPopupMenuController();

    super.initState();
  }

  @override
  void dispose() {
    _dropDown.dispose();
    _enableClean.dispose();
    _menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _suffConstraints = widget.suffixIconConstraints ??
        BoxConstraints(
            minHeight: 48,
            maxWidth: 8 +
                (widget.isShowClean ? 24 + 16 : 0) +
                (enableDropDown ? 24 + 16 : 0));

    final _suffIcon = widget.suffixIcon ??
        Container(
          constraints: _suffConstraints,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 8),
              if (widget.isShowClean)
                ValueListenableBuilder(
                    valueListenable: _enableClean,
                    builder: (context, clean, icon) {
                      return Visibility(
                        visible: _enableClean.value,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            if (widget.onClean != null) widget.onClean!();
                            widget.editingController?.clear();
                            _enableClean.value =
                                widget.editingController?.text.isNotEmpty ==
                                    true;
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 16),
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              Assets.images.icon.comInputDelet.path,
                              width: 24,
                              height: 24,
                              package: 'component',
                            ),
                          ),
                        ),
                      );
                    }),
              if (enableDropDown)
                Visibility(
                  visible: enableDropDown,
                  child: ObPopupMenu(
                    child: Container(
                      padding: EdgeInsets.only(right: 16),
                      alignment: Alignment.centerLeft,
                      child: ValueListenableBuilder(
                          valueListenable: _dropDown,
                          builder: (context, clean, icon) {
                            return Image.asset(
                              _dropDown.value
                                  ? Assets.images.icon.homeZhanghaoMoreDown.path
                                  : Assets.images.icon.homeZhanghaoMoreTop.path,
                              width: 24,
                              height: 24,
                              package: 'component',
                            );
                          }),
                    ),
                    arrowColor: widget.arrowColor ?? Colors.transparent,
                    controller: _menuController,
                    menuBuilder: widget.menuBuilder ?? _buildClickPressMenu,
                    barrierColor: widget.barrierColor ?? Colors.transparent,
                    pressType: widget.pressType,
                    verticalMargin: widget.verticalMargin,
                    horizontalMargin: widget.horizontalMargin,
                    focusNode: widget.focusNode,
                    position: widget.position,
                    showArrow: widget.showArrow,
                    arrowSize: widget.arrowSize,
                    enablePassEvent: widget.enablePassEvent,
                    menuOnChange: (isShow) {
                      if (widget.menuOnChange != null) {
                        widget.menuOnChange!(isShow);
                      }
                      _dropDown.value = isShow;
                    },
                  ),
                ),
            ],
          ),
        );

    return InputTextField(
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      width: widget.width,
      height: widget.height,
      enabled: widget.enabled,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      inputFormatters: widget.inputFormatters,
      editingController: widget.editingController,
      contextMenuBuilder: widget.contextMenuBuilder,
      cursorColor: widget.cursorColor,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      textStyle: widget.textStyle,
      onSubmitted: widget.onSubmitted,
      fillColor: widget.fillColor,
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      contentPadding: widget.contentPadding,
      border: widget.border,
      enabledBorder: widget.enabledBorder,
      focusedBorder: widget.focusedBorder,
      disabledBorder: widget.disabledBorder,
      errorBorder: widget.errorBorder,
      focusedErrorBorder: widget.focusedBorder,
      prefixIcon: widget.prefixIcon,
      prefixIconConstraints: widget.prefixIconConstraints,
      suffixIcon: _suffIcon,
      suffixIconConstraints: _suffConstraints,
      onChanged: (string) {
        _enableClean.value = string.isNotEmpty;
        if (widget.onChanged != null) widget.onChanged!(string);
      },
      error: widget.error,
      errorMaxLines: widget.errorMaxLines,
      errorStyle: widget.errorStyle,
      errorText: widget.errorText,
    );
  }

  Widget _buildClickPressMenu() {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Column(
          children: widget.options!
              .asMap()
              .map(
                (index, item) => MapEntry(
                  index,
                  _handItemWidget(index, item),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }

  Widget _handItemWidget(int index, UIToggleItemUser item) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                _menuController.hideMenu();
                widget.onUserChoose?.call(index);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 12, 8),
                    child: Avatar.circle(
                      radius: 16,
                      backgroundImage: isAvatarHttpUrl(item.userAvatarUrl)
                          ? NetworkImage(item.userAvatarUrl)
                          : AssetImage(
                              Assets.images.avatar.squareNormal.path,
                              package: 'component',
                            ) as ImageProvider,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item.username,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _menuController.hideMenu();
              widget.onUserRemove?.call(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset(
                Assets.images.icon.comInputDelet.path,
                width: 24,
                height: 24,
                package: 'component',
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isAvatarHttpUrl(String url) {
    return url.startsWith('http');
  }
}
