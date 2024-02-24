import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/widgets.dart';

/// 二维码
class QrCode extends StatelessWidget {
  /// 二维码
  const QrCode({
    required this.value,
    required this.color,
    super.key,
    this.size = 60,
    this.errorLevel = ErrorLevel.M,
    this.backgroundColor,
  });

  /// 扫描后的文本
  final String value;

  /// 二维码纠错等级
  final ErrorLevel errorLevel;

  /// 二维码背景颜色
  final Color? backgroundColor;

  /// 二维码颜色
  final Color color;

  /// 二维码大小
  final double size;

  @override
  Widget build(BuildContext context) {
    return BarcodeWidget(
      barcode: Barcode.qrCode(
        errorCorrectLevel: BarcodeQRCorrectionLevel.values[errorLevel.index],
      ),
      data: value,
      width: size,
      height: size,
      backgroundColor: backgroundColor,
      color: color,
    );
  }
}

/// 二维码纠错等级
enum ErrorLevel {
  L,
  M,
  Q,
  H,
}
