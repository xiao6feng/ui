import 'dart:io';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'linear_percent_indicator.dart';

///
class UpdateImage extends StatelessWidget {
  ///
  const UpdateImage({
    required this.url,
    required this.tag,
    this.enableTag = true,
    this.progress = 0,
    super.key,
  });

  /// 图片地址
  final String url;

  /// tag
  final String tag;

  /// 是否显示 tag
  final bool enableTag;

  /// 当前进度
  final double progress;

  ImageProvider get _imageProvider {
    if (url.startsWith('http') || url.startsWith('https')) {
      return NetworkImage(url);
    }
    return FileImage(File(url));
  }

  @override
  Widget build(BuildContext context) {
    final uploadTheme = Theme.of(context).extension<AppTheme>()?.uploadTheme;
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            /// 图片展示位置
            Positioned(
              child: SizedBox(
                width: uploadTheme?.imageSize ?? 72,
                height: uploadTheme?.imageSize ?? 72,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(uploadTheme?.imageRadius ?? 8.0),
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Image(
                    image: ResizeImage(_imageProvider,
                        width: uploadTheme?.imageSize.toInt() ?? 72,
                        height: uploadTheme?.imageSize.toInt() ?? 72),
                  ),
                ),
              ),
            ),

            Text(
              '正在上传',
              style: uploadTheme?.uploadTextStyle ??
                  const TextStyle(fontSize: 12, color: Colors.white),
            ),

            ///进度条
            Positioned(
              left: 8,
              right: 8,
              bottom: 0,
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: uploadTheme?.progressHeight ?? 3,
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: uploadTheme?.progressColor ?? Colors.white30,
                ),
                child: LinearPercentIndicator(
                  height: uploadTheme?.progressHeight ?? 3,
                  percent: progress > 1 ? 1 : progress,
                ),
              ),
            ),
          ],
        ),
        if (tag.isNotEmpty) const SizedBox(height: 8),
        if (tag.isNotEmpty)
          Text(
            tag,
            style: uploadTheme?.tagStyle ??
                const TextStyle(
                  fontSize: 12,
                  color: Color(0x99FFFFFF),
                ),
          )
      ],
    );
  }
}
