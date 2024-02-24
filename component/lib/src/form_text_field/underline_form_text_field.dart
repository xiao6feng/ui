import 'package:flutter/material.dart' hide TextTheme;
import 'package:theme/theme.dart';

import 'form_text_field.dart';

class UnderlineFormTextField extends InputFormTextField {
  const UnderlineFormTextField({
    Key? key,
    this.title,
    this.titleStyle,
    super.editingController,
    super.onChanged,
    super.inputFormatters,
    super.enabled = true,
    super.focusNode,
    super.autofocus = false,
    super.obscureText = false,
    super.prefixIcon,
    super.prefixIconConstraints,
    super.suffixIcon,
    super.suffixIconConstraints,
    super.hintText,
    super.keyboardType,
    super.onSubmitted,
    super.contentPadding =
        const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
    super.maxLength,
    super.maxLines,
    super.textStyle,
    super.hintStyle,
    super.border,
    super.focusedBorder = const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0x0affffff))),
    super.errorBorder,
    super.cursorColor,
    super.fillColor,
    super.enabledBorder = const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0x0affffff))),
    super.disabledBorder,
    super.focusedErrorBorder,
    super.width,
    super.height,
    super.contextMenuBuilder,
    super.textFieldTheme,
    super.validator,
    super.onTap,
    super.counterText,
    super.errorText,
    super.error,
    super.errorMaxLines,
    super.errorStyle,
    super.readOnly,
    super.textAlign,
    super.initialValue,
  });

  final String? title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final TextTheme? textTheme =
        Theme.of(context).extension<AppTheme>()?.textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: titleStyle ?? textTheme?.subtitleStyle,
          ),
        super.build(context),
      ],
    );
  }
}
