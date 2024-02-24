import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:theme/theme.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController? editingController;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
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
  final EdgeInsetsGeometry?
      contentPadding; //修改TextField的高度(prefixIcon/suffixIcon 有值时无效，会出现一个最小的高度)

  final int? maxLength;
  final int? maxLines;
  final Color? cursorColor;
  final Color? fillColor;
  final double? width;
  final double? height; //需大于等于 prefixIcon/suffixIcon height

  final TextAlign textAlign;

  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final TextFieldTheme? textFieldTheme;
  final Widget? error;
  final int? errorMaxLines;
  final TextStyle? errorStyle;
  final String? errorText;

  const InputTextField({
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
    this.contentPadding,
    this.maxLength,
    this.textStyle,
    this.hintStyle,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.cursorColor,
    this.fillColor,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.width,
    this.height,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.contextMenuBuilder,
    this.textFieldTheme,
    this.error,
    this.errorMaxLines,
    this.errorStyle,
    this.errorText,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextFieldTheme? theme = textFieldTheme ??
        Theme.of(context).extension<AppTheme>()?.textFieldTheme;

    final titleStyle = textStyle ??
        theme?.style ??
        TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        );
    final placeholderStyle = hintStyle ??
        theme?.hintStyle ??
        TextStyle(
          fontSize: 16,
          color: Colors.white30,
          fontWeight: FontWeight.w400,
        );
    final errorsStyle = errorStyle ??
        theme?.errorStyle ??
        TextStyle(
          fontSize: 12.0,
          color: Color(0xffFF5722),
          fontWeight: FontWeight.w400,
        );

    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: height ?? double.infinity,
          maxWidth: width ?? double.infinity),
      child: TextField(
        onTap: onTap,
        readOnly: readOnly,
        enabled: enabled,
        maxLength: maxLength,
        maxLines: maxLines,
        textAlign: textAlign,
        inputFormatters: inputFormatters,
        controller: editingController,
        contextMenuBuilder: contextMenuBuilder,
        cursorColor: cursorColor ?? theme?.cursorColor ?? Color(0xFFFF5722),
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textAlignVertical: TextAlignVertical.center,
        focusNode: focusNode,
        autofocus: autofocus,
        style: titleStyle,
        onSubmitted: onSubmitted,
        enableInteractiveSelection:
            kIsWeb ? false : true, //h5这个flutter的选择文字菜单与浏览器原生的有点冲突，需要屏蔽
        decoration: InputDecoration(
          // isCollapsed: true,
          filled: fillColor != null,
          fillColor: fillColor,
          hintText: hintText,
          hintMaxLines: 1,
          hintStyle: placeholderStyle,
          contentPadding: contentPadding ??
              EdgeInsets.only(top: 14, bottom: 14), //web上输入的文字偏上不居中
          border: border,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          disabledBorder: disabledBorder,
          errorBorder: errorBorder,
          focusedErrorBorder: focusedBorder,
          prefixIcon: prefixIcon,
          prefixIconConstraints: prefixIconConstraints,
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints,
          error: error,
          errorMaxLines: errorMaxLines,
          errorStyle: errorsStyle,
          errorText: errorText,
        ),
      ),
    );
  }
}
