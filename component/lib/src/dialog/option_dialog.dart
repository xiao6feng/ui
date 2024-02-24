import 'package:component/src/button/button_size.dart';
import 'package:component/src/button/primary_button.dart';
import 'package:component/src/button/secondary_button.dart';
import 'package:component/src/dialog/raw_dialog.dart';
import 'package:component/src/radio/radio.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// 选项对话框
class OptionDialog extends StatefulWidget {
  /// 选项对话框
  const OptionDialog({
    required this.title,
    required this.optionText,
    required this.content,
    super.key,
    this.value = false,
    this.confirmText,
    this.cancelText,
    this.background,
    this.shape,
    this.onCancelListener,
    this.onConfirmListener,
  });

  /// 选项默认值
  final bool value;

  /// 标题
  final String title;

  /// 选项文字
  final String optionText;

  /// 内容文字
  final String content;

  /// 确定按钮文字
  final String? confirmText;

  /// 取消按钮文字
  final String? cancelText;

  /// 对话框背景
  final Color? background;

  /// 对话框形状
  final ShapeBorder? shape;

  /// 取消回调
  final VoidCallback? onCancelListener;

  /// 确定回调
  final VoidCallback? onConfirmListener;

  @override
  State<OptionDialog> createState() => _OptionDialogState();
}

class _OptionDialogState extends State<OptionDialog> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final dialogTheme = Theme.of(context).extension<AppTheme>()?.dialogTheme;
    return RawDialog(
      shape: widget.shape,
      background: widget.background,
      titleWidget: Text(widget.title),
      contentWidget: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(widget.content),
              ),
            ],
          ),
          const SizedBox(height: 24),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                value = !value;
              });
            },
            child: Row(
              children: [
                AbsorbPointer(
                  child: ObRadio(
                    value: value,
                  ),
                ),
                const SizedBox(width: 8),
                DefaultTextStyle(
                  style: dialogTheme?.optionTextStyle ??
                      TextStyle(
                        color: const Color(0xFFFFFFFF).withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                  child: Text(
                    widget.optionText,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
      actionsWidget: Row(
        children: <Widget>[
          if (widget.onCancelListener != null)
            Expanded(
              child: SecondaryButton(
                size: ButtonSize.large,
                block: true,
                onPressed: widget.onCancelListener,
                child: Text(
                  widget.cancelText ?? '取消',
                  textAlign: TextAlign.center,
                  style: const TextStyle(height: 1),
                ),
              ),
            ),
          if (widget.onCancelListener != null &&
              widget.onConfirmListener != null)
            const SizedBox(width: 24),
          if (widget.onConfirmListener != null)
            Expanded(
              child: PrimaryButton(
                size: ButtonSize.large,
                block: true,
                onPressed: widget.onConfirmListener,
                child: Text(
                  widget.confirmText ?? '确定',
                  textAlign: TextAlign.center,
                  style: const TextStyle(height: 1),
                ),
              ),
            )
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant OptionDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      value = widget.value;
    }
  }
}
