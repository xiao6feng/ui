import 'package:component/gen/assets.gen.dart';
import 'package:flutter/material.dart' hide TextTheme;
import 'package:flutter/services.dart';
import 'package:theme/theme.dart';

import 'text_field.dart';
import 'text_field_border_style.dart';

class PasswordTextField extends StatefulWidget {
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
  final ValueChanged<bool>? obscureChanged;

  final Widget? error;
  final int? errorMaxLines;
  final TextStyle? errorStyle;
  final String? errorText;

  final bool isShowClean;
  final VoidCallback? onClean;

  final String? title;
  final TextStyle? titleStyle;

  final TextFieldBorderStyle textFieldBorderStyle;
  final VoidCallback? onTap;
  final bool readOnly;

  const PasswordTextField({
    Key? key,
    required this.editingController,
    this.onChanged,
    this.inputFormatters,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
    this.obscureText = true,
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
    this.obscureChanged,
    this.error,
    this.errorMaxLines,
    this.errorStyle,
    this.errorText,
    this.isShowClean = true,
    this.onClean,
    this.title,
    this.titleStyle,
    this.textFieldBorderStyle = TextFieldBorderStyle.underline,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late bool _enableObscure;
  final ValueNotifier<bool> _enableClean = ValueNotifier<bool>(false);

  @override
  void initState() {
    _enableObscure = widget.obscureText;
    super.initState();
  }

  @override
  void dispose() {
    _enableClean.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final suffConstraints = widget.suffixIconConstraints ??
        BoxConstraints(
            minHeight: 48,
            maxWidth: 8 + (widget.isShowClean ? 24 + 16 : 0) + 24 + 16);

    final _suffIcon = widget.suffixIcon ??
        Container(
          constraints: suffConstraints,
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
                            widget.editingController.clear();
                            _enableClean.value =
                                widget.editingController.text.isNotEmpty ==
                                    true;
                          },
                          child: Container(
                            height: 48,
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    _enableObscure = !_enableObscure;
                  });
                  if (widget.obscureChanged != null)
                    widget.obscureChanged!(_enableObscure);
                },
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(right: 16),
                    child: _enableObscure
                        ? Image.asset(
                            Assets.images.icon.loginEyeOn.path,
                            width: 24,
                            height: 24,
                            package: 'component',
                          )
                        : Image.asset(
                            Assets.images.icon.loginEye.path,
                            width: 24,
                            height: 24,
                            package: 'component',
                          )),
              ),
            ],
          ),
        );

    final TextTheme? textTheme =
        Theme.of(context).extension<AppTheme>()?.textTheme;

    Color? _fillColor = widget.fillColor;
    InputBorder? _border = widget.border;
    InputBorder? _focusedBorder = widget.focusedBorder;
    InputBorder? _enabledBorder = widget.enabledBorder;

    switch (widget.textFieldBorderStyle) {
      case TextFieldBorderStyle.underline:
        _focusedBorder = const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0x0affffff)));
        _enabledBorder = const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0x0affffff)));
        break;

      case TextFieldBorderStyle.oval:
        _border = const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide.none);
        _fillColor = Colors.white10;

        break;
      default:
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: widget.titleStyle ?? textTheme?.subtitleStyle,
          ),
        InputTextField(
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          textAlign: widget.textAlign,
          inputFormatters: widget.inputFormatters,
          editingController: widget.editingController,
          contextMenuBuilder: widget.contextMenuBuilder,
          cursorColor: widget.cursorColor,
          onChanged: (string) {
            _enableClean.value = string.isNotEmpty;
            if (widget.onChanged != null) widget.onChanged!(string);
          },
          obscureText: _enableObscure,
          keyboardType: widget.keyboardType,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          textStyle: widget.textStyle,
          onSubmitted: widget.onSubmitted,
          fillColor: _fillColor,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          contentPadding: widget.contentPadding,
          border: _border,
          enabledBorder: _enabledBorder,
          focusedBorder: _focusedBorder,
          disabledBorder: widget.disabledBorder,
          errorBorder: widget.errorBorder,
          focusedErrorBorder: widget.focusedBorder,
          prefixIcon: widget.prefixIcon,
          prefixIconConstraints: widget.prefixIconConstraints,
          suffixIcon: _suffIcon,
          suffixIconConstraints: suffConstraints,
          error: widget.error,
          errorMaxLines: widget.errorMaxLines,
          errorStyle: widget.errorStyle,
          errorText: widget.errorText,
        ),
      ],
    );
  }
}
