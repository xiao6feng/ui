import 'package:flutter/material.dart';

import 'text_field.dart';

class OvalTextField extends InputTextField {
  const OvalTextField({
    Key? key,
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
    super.contentPadding = const EdgeInsets.only(left: 20, top: 13, bottom: 13),
    super.maxLength,
    super.maxLines,
    super.textStyle,
    super.hintStyle,
    super.border = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        borderSide: BorderSide.none),
    super.focusedBorder,
    super.errorBorder,
    super.cursorColor,
    super.fillColor = Colors.white10,
    super.enabledBorder,
    super.disabledBorder,
    super.focusedErrorBorder,
    super.width,
    super.height,
    super.contextMenuBuilder,
    super.textFieldTheme,
    super.error,
    super.errorMaxLines,
    super.errorStyle,
    super.errorText,
    super.onTap,
    super.readOnly,
  });
}
