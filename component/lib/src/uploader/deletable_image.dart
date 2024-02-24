import 'dart:io';

import 'package:component/gen/assets.gen.dart';
import 'package:component/src/uploader/uploader.dart';
import 'package:flutter/material.dart' hide ButtonTheme, IconTheme, TextTheme;
import 'package:theme/theme.dart';

/// 可删除照片
class DeletableImage extends StatelessWidget {
  ///
  const DeletableImage({
    required this.url,
    required this.tag,
    this.enableTag = true,
    this.onDelete,
    this.onPreview,
    super.key,
  });

  /// 图片地址
  final String url;

  /// tag
  final String tag;

  /// 是否显示 tag
  final bool enableTag;

  /// 删除事件回调
  final OnDelete? onDelete;

  /// 图片预览
  final OnPreview? onPreview;

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
          children: <Widget>[
            Positioned(
              child: GestureDetector(
                onTap: () => onPreview?.call(url),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: ResizeImage(_imageProvider,
                        width: uploadTheme?.imageSize.toInt() ?? 72,
                        height: uploadTheme?.imageSize.toInt() ?? 72),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 4,
              top: 4,
              child: GestureDetector(
                onTap: () => onDelete?.call(url),
                child: Image.asset(
                  Assets.images.icon.comDelete.path,
                  width: uploadTheme?.deleteImageSize ?? 16,
                  height: uploadTheme?.deleteImageSize ?? 16,
                  package: 'component',
                ),
              ),
            )
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
