import 'package:component/component.dart' hide AppBar,Image;
import 'package:component/gen/assets.gen.dart';
import 'package:flutter/material.dart' hide AppBarTheme;
import 'package:flutter/services.dart';
import 'package:theme/theme.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.editingController,
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
    this.contentPadding = const EdgeInsets.only(left: 20, top: 13, bottom: 13),
    this.maxLength,
    this.textStyle,
    this.hintStyle,
    this.border = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide.none),
    this.focusedBorder,
    this.errorBorder,
    this.cursorColor,
    this.fillColor = Colors.white10,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.width,
    this.height,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.contextMenuBuilder,
    this.textFieldTheme,
  }) : super(key: key);

  final TextEditingController editingController;
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
  final TextFieldTheme? textFieldTheme;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final ValueNotifier<bool> _enableClean = ValueNotifier<bool>(false);
  @override
  void dispose() {
    _enableClean.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppSearchBarTheme? appSearchBarTheme =
        Theme.of(context).extension<AppTheme>()?.appSearchBarTheme;

    final TextFieldTheme? textFieldTheme = appSearchBarTheme?.textFieldTheme ??
        Theme.of(context).extension<AppTheme>()?.textFieldTheme;

    final textFieldHeight =
        widget.height ?? appSearchBarTheme?.textFieldHeight ?? 36.0;
    return InputTextField(
      textFieldTheme: textFieldTheme,
      editingController: widget.editingController,
      height: textFieldHeight,
      width: widget.width,
      focusNode: widget.focusNode,
      onChanged: (string) {
        _enableClean.value = string.isNotEmpty;

        if (widget.onChanged != null) {
          widget.onChanged!(string);
        }
      },
      onSubmitted: widget.onSubmitted,
      hintText: widget.hintText,
      contentPadding: widget.contentPadding,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      textStyle: widget.textStyle,
      hintStyle: widget.hintStyle,
      border: widget.border,
      errorBorder: widget.errorBorder,
      enabledBorder: widget.enabledBorder,
      focusedBorder: widget.focusedBorder,
      disabledBorder: widget.disabledBorder,
      focusedErrorBorder: widget.focusedErrorBorder,
      cursorColor: widget.cursorColor,
      fillColor: widget.fillColor,
      textAlign: widget.textAlign,
      contextMenuBuilder: widget.contextMenuBuilder,
      prefixIcon: widget.prefixIcon ??
          appSearchBarTheme?.prefixIcon ??
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 12.0),
            child: Image.asset(
              Assets.images.icon.comSearch.path,
              width: 16,
              height: 16,
              package: 'component',
            ),
          ),
      prefixIconConstraints: widget.prefixIconConstraints ??
          BoxConstraints(minHeight: textFieldHeight, minWidth: 44),
      suffixIconConstraints: widget.prefixIconConstraints ??
          BoxConstraints(minHeight: textFieldHeight, minWidth: 44),
      suffixIcon: widget.suffixIcon ??
          ValueListenableBuilder<bool>(
            builder: (context, value, child) {
              return Visibility(
                visible: _enableClean.value,
                child: Container(
                  alignment: Alignment.center,
                  width: 44,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      widget.editingController.clear();
                      _enableClean.value = false;
                    },
                    child: Image.asset(
                      Assets.images.icon.comDelete.path,
                      width: 16,
                      height: 16,
                      package: 'component',
                    ),
                  ),
                ),
              );
            },
            valueListenable: _enableClean,
          ),
    );
  }
}
