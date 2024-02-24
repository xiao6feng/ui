import 'package:component/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// 点击上传按钮 默认为一个 ➕
class UploadSelect extends StatelessWidget {
  /// 点击上传按钮 默认为一个 ➕
  const UploadSelect({
    required this.onSelect,
    required this.tag,
    super.key,
    this.enableTag = true,
  });

  /// 选中回调
  final VoidCallback onSelect;

  /// tag
  final String tag;

  /// 是否显示 tag
  final bool enableTag;

  @override
  Widget build(BuildContext context) {
    final uploadTheme = Theme.of(context).extension<AppTheme>()?.uploadTheme;
    return GestureDetector(
      onTap: onSelect,
      child: Column(
        children: <Widget>[
          Container(
            width: uploadTheme?.imageSize ?? 72,
            height: uploadTheme?.imageSize ?? 72,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(uploadTheme?.imageRadius ?? 8),
              color: uploadTheme?.backgroundColor ?? const Color(0x0affffff),
            ),
            child: Image.asset(
              Assets.images.icon.courseAdd.path,
              width: uploadTheme?.addImageSize ?? 24,
              height: uploadTheme?.addImageSize ?? 24,
              package: 'component',
            ),
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
            ),
        ],
      ),
    );
  }
}
