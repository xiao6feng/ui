/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsGifGen {
  const $AssetsGifGen();

  /// File path: assets/gif/anigif.gif
  AssetGenImage get anigif => const AssetGenImage('assets/gif/anigif.gif');

  /// List of all assets
  List<AssetGenImage> get values => [anigif];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesAvatarGen get avatar => const $AssetsImagesAvatarGen();
  $AssetsImagesIconGen get icon => const $AssetsImagesIconGen();
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/loading.json
  String get loading => 'assets/lottie/loading.json';

  /// List of all assets
  List<String> get values => [loading];
}

class $AssetsImagesAvatarGen {
  const $AssetsImagesAvatarGen();

  /// File path: assets/images/avatar/square_normal.png
  AssetGenImage get squareNormal =>
      const AssetGenImage('assets/images/avatar/square_normal.png');

  /// List of all assets
  List<AssetGenImage> get values => [squareNormal];
}

class $AssetsImagesIconGen {
  const $AssetsImagesIconGen();

  /// File path: assets/images/icon/back.png
  AssetGenImage get back => const AssetGenImage('assets/images/icon/back.png');

  /// File path: assets/images/icon/com_back.png
  AssetGenImage get comBack =>
      const AssetGenImage('assets/images/icon/com_back.png');

  /// File path: assets/images/icon/com_delete.png
  AssetGenImage get comDelete =>
      const AssetGenImage('assets/images/icon/com_delete.png');

  /// File path: assets/images/icon/com_input_delet.png
  AssetGenImage get comInputDelet =>
      const AssetGenImage('assets/images/icon/com_input_delet.png');

  /// File path: assets/images/icon/com_search.png
  AssetGenImage get comSearch =>
      const AssetGenImage('assets/images/icon/com_search.png');

  /// File path: assets/images/icon/com_select.png
  AssetGenImage get comSelect =>
      const AssetGenImage('assets/images/icon/com_select.png');

  /// File path: assets/images/icon/course_add.png
  AssetGenImage get courseAdd =>
      const AssetGenImage('assets/images/icon/course_add.png');

  /// File path: assets/images/icon/home_zhanghao_more_down.png
  AssetGenImage get homeZhanghaoMoreDown =>
      const AssetGenImage('assets/images/icon/home_zhanghao_more_down.png');

  /// File path: assets/images/icon/home_zhanghao_more_top.png
  AssetGenImage get homeZhanghaoMoreTop =>
      const AssetGenImage('assets/images/icon/home_zhanghao_more_top.png');

  /// File path: assets/images/icon/login_eye.png
  AssetGenImage get loginEye =>
      const AssetGenImage('assets/images/icon/login_eye.png');

  /// File path: assets/images/icon/login_eye_on.png
  AssetGenImage get loginEyeOn =>
      const AssetGenImage('assets/images/icon/login_eye_on.png');

  /// File path: assets/images/icon/que_tongyong_kong.png
  AssetGenImage get queTongyongKong =>
      const AssetGenImage('assets/images/icon/que_tongyong_kong.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        back,
        comBack,
        comDelete,
        comInputDelet,
        comSearch,
        comSelect,
        courseAdd,
        homeZhanghaoMoreDown,
        homeZhanghaoMoreTop,
        loginEye,
        loginEyeOn,
        queTongyongKong
      ];
}

class Assets {
  Assets._();

  static const $AssetsGifGen gif = $AssetsGifGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
