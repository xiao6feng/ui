import 'dart:async';

import 'package:component/src/uploader/upload_select.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'deletable_image.dart';
import 'update_image.dart';

/// 点击移除文件时的回调
typedef OnDelete = void Function(String);

/// 点击预览时的回调
typedef OnPreview = void Function(String);

/// 上传文件改变时的回调
typedef OnChange = void Function(List<String>);

/// 自定义自己的上传实现
typedef CustomUploadRequest = Future<String?> Function(String,
    {required Function builder});

/// 文件选择上传和拖拽上传控件
class Uploader extends StatefulWidget {
  /// 文件选择上传和拖拽上传控件
  const Uploader({
    this.maxCount = 3,
    this.fileList = const <String>[],
    this.customRequest,
    this.customImagePath,
    this.onChange,
    this.beforeAdd,
    this.onPreview,
    this.multiple = false,
    this.enableTag = true,
    super.key,
  });

  /// 默认上传按钮默认添加在照片最后 当上传照片数到达限制后，上传按钮消失  [multiple] = true 添加多个上传按钮
  final bool multiple;

  /// 最大可选择数量
  final int maxCount;

  /// 是否禁止标签显示
  final bool enableTag;

  /// 图片列表
  final List<String> fileList;

  /// 自定义请求
  final CustomUploadRequest? customRequest;

  /// 自定义图片来源
  final FutureOr<String?> Function()? customImagePath;

  /// 上传文件改变时的状态
  final OnChange? onChange;

  /// 选择图片前的预处理 一般用于权限问题处理
  final FutureOr<bool> Function()? beforeAdd;

  /// 返回图片
  final OnPreview? onPreview;

  @override
  UploaderState createState() => UploaderState();
}

///
class UploaderState extends State<Uploader> {
  late final List<String> _dataSource = widget.fileList.toList();
  final List<_UploadImageStatus> _uploadingDataSource = <_UploadImageStatus>[];

  /// 选中图片数量
  int get selectImageLength => _dataSource.length + _uploadingDataSource.length;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: <Widget>[
        for (int i = 0; i < _dataSource.length; i++)
          DeletableImage(
            url: _dataSource[i],
            onDelete: _handleRemove,
            tag: '${i + 1}/${widget.maxCount}',
            enableTag: widget.enableTag,
            onPreview: widget.onPreview,
          ),
        for (int i = 0; i < _uploadingDataSource.length; i++)
          UpdateImage(
            url: _uploadingDataSource[i].originUrl,
            tag: '${_dataSource.length + i + 1}/${widget.maxCount}',
            enableTag: widget.enableTag,
            progress: _uploadingDataSource[i].progress,
          ),
        if (!widget.multiple && selectImageLength < widget.maxCount)
          UploadSelect(
            onSelect: () async {
              await _handleAdd(context);
            },
            tag:
                '${selectImageLength == 0 ? 0 : (selectImageLength + 1)}/${widget.maxCount}',
          ),
        if (widget.multiple && selectImageLength < widget.maxCount)
          for (int i = selectImageLength; i < widget.maxCount; i++)
            UploadSelect(
              onSelect: () async {
                await _handleAdd(context);
              },
              tag: '${i == 0 ? 0 : (i + 1)}/${widget.maxCount}',
            ),
      ],
    );
  }

  void _handleRemove(String url) {
    setState(() {
      if (mounted) {
        _dataSource.remove(url);
        widget.onChange?.call(_dataSource);
      }
    });
  }

  Future<void> _handleAdd(BuildContext context) async {
    if (_uploadingDataSource.isNotEmpty) return;
    String? filePath;
    if (widget.customImagePath == null) {
      final allowAdd = (await widget.beforeAdd?.call()) ?? true;
      if (allowAdd) {
        if (kIsWeb) {
          final f =
              (await ImagePicker().pickImage(source: ImageSource.gallery))!;
          filePath = f.path;
        } else {
          final assets = await AssetPicker.pickAssets(
            context,
            pickerConfig: AssetPickerConfig(maxAssets: 1),
          );
          filePath = ((await assets?.first.originFile)?.path)!;
        }
      }
    } else {
      filePath = await widget.customImagePath!();
    }
    String? url;
    if (filePath != null) {
      if (widget.customRequest != null) {
        final uploadStatus = _UploadImageStatus(filePath);
        _uploadingDataSource.add(uploadStatus);
        setState(() {});
        try {
          url = await widget.customRequest!(
            filePath,
            builder: (double process) {
              uploadStatus.progress = process;
              setState(() {});
            },
          );
          _uploadingDataSource.remove(uploadStatus);
        } catch (_) {
          _uploadingDataSource.remove(uploadStatus);
        }
        if (url == null || url == '') {
          setState(() {});
        }
      } else {
        url = filePath;
      }
    }
    setState(() {
      if ((url != null && url != '') && mounted) {
        _dataSource.add(url);
        widget.onChange?.call(_dataSource);
      }
    });
  }
}

class _UploadImageStatus {
  _UploadImageStatus(this.originUrl);

  final String originUrl;
  double progress = 0;

  bool get isUploading => progress < 1;
}
