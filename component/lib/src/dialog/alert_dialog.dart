import 'package:component/component.dart';
import 'package:component/src/button/button_size.dart';
import 'package:flutter/widgets.dart';

/// 弹出框
class AlertDialog extends StatelessWidget {
  /// 弹出框
  const AlertDialog({
    required this.title,
    required this.content,
    super.key,
    this.confirmText,
    this.cancelText,
    this.background,
    this.onCancelListener,
    this.onConfirmListener,
    this.shape,
  });

  /// 标题
  final String title;

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
  Widget build(BuildContext context) {
    return RawDialog(
      shape: shape,
      background: background,
      titleWidget: Text(title),
      contentWidget: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(content),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
      actionsWidget: Row(
        children: <Widget>[
          if (onCancelListener != null)
            Expanded(
              child: SecondaryButton(
                size: ButtonSize.large,
                block: true,
                onPressed: onCancelListener,
                child: Text(
                  cancelText ?? '取消',
                  textAlign: TextAlign.center,
                  style: const TextStyle(height: 1),
                ),
              ),
            ),
          if (onCancelListener != null && onConfirmListener != null)
            const SizedBox(width: 24),
          if (onConfirmListener != null)
            Expanded(
              child: PrimaryButton(
                size: ButtonSize.large,
                block: true,
                onPressed: onConfirmListener,
                child: Text(
                  confirmText ?? '确定',
                  textAlign: TextAlign.center,
                  style: const TextStyle(height: 1),
                ),
              ),
            )
        ],
      ),
    );
  }
}
